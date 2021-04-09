from flask import Flask, request, jsonify
from flask_cors import CORS
import mariadb
import random

app = Flask(__name__)
CORS(app)

conn = mariadb.connect(
    user="root",
    password="ynpXyi2NmKARwX",
    host="127.0.0.1",
    port=3306,
    database="oivprojektna"
)

@app.route('/getQuestion', methods=['POST'])
def get_question():
    ret = {}

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

        return jsonify(ret)

    except mariadb.Error as e:
        print("{}".format(e))
        ret['success'] = False
        return jsonify(ret)

if __name__ == "__main__":
    app.run("127.0.0.1", 5436, True)