/**
 * Created by Diogo on 26/11/2014.
 */

//$(document).ready(function() {
function autocomplete() {
//    alert('oi');
    var guests_obj = { data: '', last_data: '', timer: null };

    function fill_data(data_obj, fill_func, target_list, target_input, url) {
        data_obj.timer = null;

        if (data_obj.last_data != data_obj.data) {
            data_obj.last_data = data_obj.data;

            if (data_obj.data == '') {
                var dataList = document.getElementById(target_list);

                while (dataList.childNodes.length > 0) {
                    dataList.removeChild(dataList.childNodes[0]);
                }
            }

            data_obj.timer = window.setTimeout(fill_func, 500);

            return data_obj;
        }

        $.ajax({
            url: url,
            type: 'GET',
            data: { data: data_obj.data },
            success: function(data, textStatus, xhr){
                // Monta array de itens
                var itens = data.split('|');

                // Acha componentes
                var dataList = document.getElementById(target_list);
                var input = document.getElementById(target_input);

                // Limpa o datalist
                while (dataList.childNodes.length > 0) {
                    dataList.removeChild(dataList.childNodes[0]);
                }

                // Preenche o datalist com o resultado do banco
                for (var i = 0; i < itens.length; i++ ) {
                    try {
                        var nOpt = document.createElement("option");
                        nOpt.value = itens[i];
                        dataList.appendChild(nOpt);
                    } catch(err) {
                        alert(err);
                    }
                }

                $( '#' + target_input ).trigger( "click" );
                $( '#' + target_input ).click(function() {
                    $( '#' + target_input ).focus();
                });
            },
            error: function(erro) {
                alert(JSON.stringify(erro));
            }
        } );
        return data_obj;
    }

    function fill_guests_obj() {
        try {
            guests_obj = fill_data(guests_obj, fill_guests_obj, 'guests_list', 'guests', 'guest_autocomplete_list/');
        } catch(err) {
            alert(err);
        }
    }

    $('#guests').on('keyup', function(event) {
        guests_obj.data = this.value;
        if(guests_obj.data == '')
            return;
        if(!guests_obj.timer)
            guests_obj.timer = window.setTimeout(fill_guests_obj, 500);
    });
};
//});
