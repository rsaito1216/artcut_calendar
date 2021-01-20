import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';
import { inputChangeSelector } from '@rails/ujs'
    
document.addEventListener("DOMContentLoaded", function() {
  var calendarEl = document.getElementById('calendar');
  let calendar = new Calendar(calendarEl, {
    plugins: [ timeGridPlugin ],
    initialView: 'timeGridWeek',
    events: 'events.json',
    locale:'ja',
    timeZone: 'Asia/Tokyo',
    allDaySlot: false,
    contentHeight: 505,
    slotMinTime: "08:00:00",
    slotMaxTime: "20:00:00",
    businessHours: {
      // days of week. an array of zero-based day of week integers (0=Sunday)
      daysOfWeek: [ 0, 2, 3, 4, 5, 6 ], 
      startTime: '9:00',
      endTime: '19:00',
    }
  });
  
  calendar.render();

});