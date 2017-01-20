/**
 * Created by liyun on 28/12/16.
 */

$(document).ready(function () {

    var monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];
    var appointmentsData;

    $.ajax({
        type: "GET",
        url: "http://localhost:8080/services/appointment/S001",
        success: function (data) {
            calendar(data.appointments);
        },
        error: function () {
            alert("Error!");
        }
    });


    //  To resize the chart
    $(window).resize(function () {
        heartBeatChart.redraw();
    })

    //  Chart
    var heartBeatChart = Morris.Line({
        element: 'heart-beat-chart',
        data: [
            {y: '2012-02-24 15:00:00', a: 87, b: 90},
            {y: '2012-02-25 15:00:00', a: 75, b: 65},
            {y: '2012-02-26 15:00:00', a: 50, b: 40},
            {y: '2012-02-27 15:00:00', a: 75, b: 65},
            {y: '2012-02-28 15:00:00', a: 50, b: 40},
            {y: '2012-02-29 15:00:00', a: 75, b: 65},
            {y: '2012-03-01 15:00:00', a: 67, b: 71}
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Actual', 'Average'],
        xLabelFormat: function (x) {
            var datef = x.toDateString();
            datef = datef.substring(0, datef.length - 4);
            return datef;
        },
        hoverCallback: function (index, options, content) {
            var top = "<div class='morris-hover-row-label'>" + monthNames[options.data[index].y.substring(6, 7)] + " " + options.data[index].y.substring(8, 10) + "</div>";
            var middle = "<div class='morris-hover-point' style='color: #0b62a4'>" + "Actual: " + options.data[index].a + "</div>";
            var bottom = "<div class='morris-hover-point' style='color: #7A92A3'>" + "Average: " + options.data[index].b + "</div>";
            return top + middle + bottom;

        }
    });

    // Calendar js
    function calendar(data) {
        console.log(data);
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay,listWeek'
            },
            defaultDate: new Date(),
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            selectable: true,
            eventLimit: true, // allow "more" link when too many events
            events: data,
            eventRender: function(event, element) {
                if(event.icon){
                    element.find(".fc-title").prepend("<i class='fa fa-stethoscope'></i>");
                    element.find(".fc-list-item-title").prepend("<i class='fa fa-stethoscope'></i>");
                }
            },
            eventDrop: function(event, delta, revertFunc) {

                alert(event.title + " was dropped on " + event.start.format());

                if (!confirm("Are you sure about changing the appointment to " + event.start.format())) {
                    revertFunc();
                }
            },
            eventResize: function(event, delta, revertFunc) {

                alert(event.title + " end is now " + event.end.format());

                if (!confirm("is this okay?")) {
                    revertFunc();
                }
            },
            eventMouseover: function(calEvent,jsEvent) {
                alert("hi");
                xOffset = 10;
                yOffset = 30;
                $("body").append("<p>hi</p>");
                $("#tooltip")
                    .css("top",(jsEvent.clientY - xOffset) + "px")
                    .css("left",(jsEvent.clientX + yOffset) + "px")
                    .fadeIn("fast");
            },
            eventMouseout: function(calEvent,jsEvent) {
                $("#tooltip").remove();
            }

        });
    }


});