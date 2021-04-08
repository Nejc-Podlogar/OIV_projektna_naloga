let scoreVal = "0000"

$(document).ready(()=>{
    $("#liveScore").html(scoreVal);
    console.log(scoreVal);
    
    $("#scoreBoard").prop('disabled', false);
}) 

/** Resetiramo counter na vrednost 0 */
function resetCounter(){
    $("#liveScore").html(scoreVal);
}

function getQuestion(numbered){

    // Pridobim podatke za vprašanje
    // $.post("127.0.0.1:5436/getQuestion", {difficulty: numbered}, (result) => {
    //     openQuestionPopUp(result);
    // });

    //Premikam se naprej na naslednje vprašanje
    switch (numbered){
        case 1:
            $("#1").prop('disabled', true);
            $("#2").prop('disabled', false);
            break;
        case 2:
            $("#2").prop('disabled', true);
            $("#3").prop('disabled', false);
            break;
        case 3:
            $("#3").prop('disabled', true);
            $("#4").prop('disabled', false);
            break;
        case 4:
            $("#4").prop('disabled', true);
            $("#5").prop('disabled', false);
            break;
        case 5:
            $("#5").prop('disabled', true);
            $("#6").prop('disabled', false);
            break;
        case 6:
            $("#6").prop('disabled', true);
            $("#7").prop('disabled', false);
            break;
        case 7:
            $("#7").prop('disabled', true);
            $("#8").prop('disabled', false);
            break;
        case 8:
            $("#8").prop('disabled', true);
            $("#9").prop('disabled', false);
            break;
        case 9:
            $("#9").prop('disabled', true);
            $("#10").prop('disabled', false);
            break;
        case 10:
            $("#10").prop('disabled', true);
            $("#1").prop('disabled', false);
            break;
    }
}

/**
 * 
 * @param {*} data 
 */
function openQuestionPopUp(data){

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

    let list = [
        {'ocena': 1, 'oseba': 'Nejc'},
        {'ocena': 2, 'oseba': 'David'},
        {'ocena': 3, 'oseba': 'Jakob'}
    ];
    $('#fullList').empty();
    $("#scoreList").append($('<ul id="fullList"></ul>'));
    
    console.log("append items");
    for(let i = 0; i < list.length; i++){
        $('#fullList').append(
            $(`
                <li>
                <div class="listLine">
                <div class="smallHead">${i + 1}</div>
                <div>${list[i]['ocena']}</div>
                <div>${list[i]['oseba']}</div>
                </div>
                </li>
            `)
        );
    }
    

    $(".scorePopUp").css('display', 'flex');
    $('#scoreBoard').prop('disabled', true);
}


