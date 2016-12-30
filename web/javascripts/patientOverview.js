/**
 * Created by liyun on 29/12/16.
 */
$(document).ready(function () {

    var table = $('#patientList').DataTable({
        "aoColumnDefs": [
            {
                'bSortable': false,
                'aTargets': [1, 2, 3, 4]
            }],
        "lengthMenu": [5, 10, 15, 20],
        "pageLength": 10,
        "sDom": "<'row'<'col-sm-6'<'pull-left'f><'toolbar'>><'col-sm-6'<'pull-right'l>>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-7'p>>",
        // initComplete: function(){
        //     $("div.toolbar").html('<button type="button" id="any_button">!</button>');
        // },
        "oLanguage": { "sSearch": '<span class="glyphicon glyphicon-search form-control-feedback"></span>',
            "sZeroRecords": "No patients found",
            "sEmptyTable": "No patients available in table"
        },
        // "sDom": ''
    });

});
// $(document).ready(function (){
//     var table = $('#patientList').DataTable({
//         sdom: '',
//         initComplete: function(){
//             $("div.test").html('<button type="button" id="any_button">!</button>');
//         }
//     });
// });