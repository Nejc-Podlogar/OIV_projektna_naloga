from flask import Flask, request, jsonify
from flask_cors import CORS
import mariadb
import random

app = Flask(__name__)
CORS(app)

conn = None

def connect_to_database():
    return mariadb.connect(
        user="root",
        password="admin123",
        host="127.0.0.1",
        port=5342,
        database="oivprojektna"
    )

@app.route('/getQuestion', methods=['POST'])
def get_question():
    ret = {}

    conn = connect_to_database()

    try:
        content = request.get_json()
        difficulty = content['difficulty']

        if (difficulty is None):
            ret['success'] = False
            return jsonify(ret)

        cursor = conn.cursor()

        sql = "SELECT ID, question, difficulty, description FROM questions WHERE difficulty = {};".format(int(difficulty))
        #sql = "SELECT q.ID, q.question, q.difficulty, q.description, a.answer, a.isCorrect, a.ID FROM questions AS q INNER JOIN answers a ON a.fk_question = q.ID WHERE q.difficulty = {}".format(int(difficulty))
        cursor.execute(sql)

        data_questions = cursor.fetchall()
        
        random_index = random.randint(0, len(data_questions) - 1)

        sql= "SELECT answer, isCorrect FROM answers WHERE fk_question = {}".format(data_questions[random_index][0])

        cursor.execute(sql)

        data_answers = cursor.fetchall()
        random.shuffle(data_answers)

        question = {}
        question['question'] = data_questions[random_index][1]
        question['difficulty'] = data_questions[random_index][2]
        question['description'] = data_questions[random_index][3]
        ret['question'] = question
        
        answers = []
        for data_answer in data_answers:
            answer= {}
            answer['answer'] = data_answer[0]
            answer['isCorrect'] = data_answer[1]
            answers.append(answer)

        ret['answers'] = answers
        ret['success'] = True

        conn.close()
        return jsonify(ret)

    except mariadb.Error as e:
        conn.close()
        print("{}".format(e))
        ret['success'] = False
        return jsonify(ret)

@app.route('/leaderboard', methods=['POST'])
def leaderboard():
    ret = {}
    conn = connect_to_database()
    try:
        cursor = conn.cursor()

        sql = "SELECT * FROM leaderboard ORDER BY score DESC, time ASC LIMIT 10;";
        cursor.execute(sql)

        leaders = cursor.fetchall()

        leaderboard_arr = []
        for leader in leaders:
            lead = {}
            lead['player_name'] = leader[1]
            lead['score'] = leader[2]
            lead['time'] = leader[3]

            leaderboard_arr.append(lead)

        ret['leaderboard'] = leaderboard_arr
        ret['success'] = True
        conn.close()
        return jsonify(ret)

    except mariadb.Error as e:
        conn.close()
        print("{}".format(e))
        ret['success'] = False
        return jsonify(ret)

@app.route('/newScore', methods=['POST'])
def new_score():
    ret = {}
    conn = connect_to_database()
    try:
        content = request.get_json()
        player_name = content['player_name']
        score = content['score']
        time = content['time']

        if (player_name is None or score is None or time is None):
            ret['success'] = False
            return jsonify(ret)

        cursor = conn.cursor()
        sql = "INSERT INTO leaderboard (player_name, score, time) VALUES ('{}', {}, {});".format(player_name, int(score), int(time));
        cursor.execute(sql)

        conn.commit()

        ret['success'] = True
        conn.close()
        return jsonify(ret)
    except mariadb.Error as e:
        conn.close()
        print("{}".format(e))
        ret['success'] = False
        return jsonify(ret)

if __name__ == "__main__":
    app.run("127.0.0.1", 5436, True)