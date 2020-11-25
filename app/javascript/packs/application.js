// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';
    
document.addEventListener("turbolinks:load", function() {
  var calendarEl = document.getElementById('calendar');
  let calendar = new Calendar(calendarEl, {
    plugins: [ timeGridPlugin ],
    initialView: 'timeGridWeek',
    events: 'events.json',
    locale:'ja',
    timeZone: 'Asia/Tokyo',
    allDaySlot: false,
    contentHeight: 500,
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


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
