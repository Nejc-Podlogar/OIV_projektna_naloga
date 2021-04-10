let scoreVal = 0
let url = "http://127.0.0.1:5436"
let globalDifficulty;
let globalTime = 0;

$(document).ready(()=>{
    $("#liveScore").html(scoreVal);
    console.log(scoreVal);
    
    $("#scoreBoard").prop('disabled', false);

    $.ajaxSetup({
        headers: {
            'content-type': "application/json; charset=utf-8"
        }
    })

    

}) 

/** Resetiramo counter na vrednost 0 */
function resetCounter(){
    scoreVal = 0;
    console.log("Resetiram")
    console.log(globalDifficulty)
    location.reload(true);
}

/**
 * Pridobimo vprašanje ustrezne težavnosti ter ga prikažemo
 * @param {*} numbered 
 */
function getQuestionVal(numbered){
    globalDifficulty = numbered;
    console.log(Number(numbered));
    // Pridobim podatke za vprašanje
    $.post(url + "/getQuestion",JSON.stringify({difficulty: numbered}), (result) => {
        console.log(result)
        openQuestionPopUp(result);
    }, 'json');

}

/**
 * 
 * @param {*} data 
 */
function openQuestionPopUp(data){

    let question = data["question"];
    let answers = data["answers"];

    //Pobrišemo prejšnje gumbe:
    $("#answers").empty();
    $("#description").css('display', 'none');


    // Nastavimo vrednosti v pop up polje
    $("#question").text(question["question"])

    //Zgradi možne odgovore
    for(let i = 0; i < answers.length; i++){
        console.log(i);
        let singleAnsw = answers[i];
        $("#answers").append(`
            <button id="${i}answer" class="btnAnswer" onclick="answerSelected(${singleAnsw["isCorrect"]}, ${answers.length}, ${i})">${singleAnsw["answer"]}</button>
        `);

        //Nastavim pravilen rezulatat v razlagi.
        if(singleAnsw["isCorrect"] == 1){
            $("#resCorrectVal").text(singleAnsw["answer"]);
        }
    }

    $("#descriptionText").text(question["description"]);

    $(".fullScreen").css('display', 'block')
    $(".qPopUp").css('display', 'flex')

}

function answerSelected(isCorrect, allAnsw, currAnsw){
    
    for(let i = 0; i < allAnsw; i++){
        if(i != currAnsw){
            $(`#${i}answer`).prop('disabled', true);
        }
    }
    
    //Prikažemo obrazložitev
    $("#description").css('display', 'block')
    if(isCorrect == 0){
        $("#correctBox").css('display', 'flex');
    }else{
        $("#correctBox").css('display', 'none');

    }
    

    
    if(isCorrect == 1){
        scoreVal += 100;
        
        //Gremo na naslednje vprašanje
        $("#liveScore").html(scoreVal);
        if(globalDifficulty != 10){
            $(`#${globalDifficulty}`).prop('disabled', true);
            $(`#${globalDifficulty + 1}`).prop('disabled', false);
        }else{
            $(`#${globalDifficulty}`).prop('disabled', true);
            $(".resetScore").addClass("nextStep");
        }
    }else{
        $(`#${globalDifficulty}`).prop('disabled', true);
        $(".resetScore").addClass("nextStep");  
    }
    
    $("#cancelQ").prop('disabled', true)
    $("#nextQ").prop('disabled', false)
}

/**
 * Zaprem vprašanje.
 * Argument je naslednja vrednost.
 * @param {*} nextVal 
 */
function closeQuestion(nextVal){

    $(".fullScreen").css('display', 'none')
    $(".qPopUp").css('display', 'none')
    $("#cancelQ").prop('disabled', false)
    $("#nextQ").prop('disabled', true)
}

/**
 * Funkcija dobi zgenerira seznam vseh shranjenih igralcev in jih prikaže.
 * V primeru da je val == false, pa samo skrije objekt.
 * @param {*} val 
 * @returns 
 */
function buildList(val){
    if(val == false){
        $(".scorePopUp").css('display', 'none');
        $('#scoreBoard').prop('disabled', false);
        return;
    }
    
    $.post(url + "/leaderboard", (result) => {
        console.log(result);
        if(result["success"] == false){
            alert("Napaka pri pridobivanju podatkov.");
            return;
        }
    
        let list = result["leaderboard"];
        $('#fullList').empty();
        $("#scoreList").append($('<ul id="fullList"></ul>'));
        
        console.log("append items");
        for(let i = 0; i < list.length; i++){
            $('#fullList').append(
                $(`
                    <li>
                    <div class="listLine">
                    <div class="smallHead">${i + 1}</div>
                    <div>${list[i]['score']}</div>
                    <div>${list[i]['player_name']}</div>
                    <div>${list[i]['time']}</div>
                    </div>
                    </li>
                `)
            );
        }
        
    
        $(".scorePopUp").css('display', 'flex');
        $('#scoreBoard').prop('disabled', true);
    })

}

/**
 * Dodamo nov rezultat v bazo oz. na lestvico.
 */
function addScore(){

    let player_name = $("#iname").val();
    if(player_name != ""){
        //Shranimo novo vrednost v bazo.
        $.post(url + "/newScore", JSON.stringify({player_name: player_name, score: scoreVal, time: globalTime}), (result) => {

            console.log(result);
            //V koliko je bilo shranjevanje uspešno to izpišem in zaprem formo.
            if(result["success"] == true){

                alert("Uspešno shranjen rezultat");
                $(".userScore").css('display', 'none');
                $("#newScore").prop('disabled', false);

            }else{
                alert("Napaka pri shranjevanju rezultata");
            }


        },'json')
    }else{
        alert("Vnesi svoje ime oziroma vzdevek."); //V kolikor uporabnik ni vnesel imena.
    }


}

/**
 * Prikažemo popUp za dodajanje vrednosti.
 */
function addScoreForm(){

    $("#newScore").prop('disabled', true);
    console.log("dodajam rezultat");
    console.log(scoreVal);
    $("#iscore").val(scoreVal); //Nastavim vrednost rezultat.
    $("#itime").val(globalTime); //Nastavim vrednost čas.
    $(".userScore").css('display', 'block'); //Prikažem formo.

}
