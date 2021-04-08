// window.addEventListener("DOMContentLoaded", () => {
  // const path =location.pathname
  // const pathRegex = /^(?=.*events)(?=.*edit)/
  // console.log(path);
  // if (path === "/events/new" || path === "/events" || pathRegex.test(path)) {
    document.addEventListener("DOMContentLoaded", function(event){
      const startYearForm = document.getElementById('event_start_date_1i');
      const endYearForm = document.getElementById('event_end_date_1i');
      const startMonthForm = document.getElementById('event_start_date_2i');
      const endMonthForm = document.getElementById('event_end_date_2i');
      const startDayForm = document.getElementById('event_start_date_3i');
      const endDayForm = document.getElementById('event_end_date_3i');
      // const startHourForm = document.getElementById('event_start_date_4i');
      // const endHourForm = document.getElementById('event_end_date_4i');

      let yearValue = startYearForm.value;
      endDayForm.value = yearValue
      let monthValue = startMonthForm.value;
      endDayForm.value = monthValue
      let dayValue = startDayForm.value;
      endDayForm.value = dayValue
      // let hourValue = startHourForm.value;
      // endHourForm.value = hourValue
      startYearForm.addEventListener('change', (event) => {
        const yearValue = startYearForm.value;
        endYearForm.value = yearValue;
      })
      startMonthForm.addEventListener('change', (event) => {
        const monthValue = startMonthForm.value;
        endMonthForm.value = monthValue
      })
      startDayForm.addEventListener('change', (event) => {
        const dayValue = startDayForm.value;
        endDayForm.value = dayValue
      })
      // startHourForm.addEventListener('change', (event) => {
      //   const hourValue = startHourForm.value;
      //   endHourForm.value = hourValue
      // })

      document.addEventListener('change', (event) => {
        var endHourForm = document.getElementById('event_end_date_4i').value;
        const endMinuteForm = document.getElementById('event_end_date_5i');
        if(endHourForm === "19"){
          endMinuteForm.value = "00";
        }
      })

      
    })

    
  //  }
//  });