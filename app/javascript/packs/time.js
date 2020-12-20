if (document.URL.match("/new") || document.URL.match("/edit")) {
  document.addEventListener("turbolinks:load", function(){
    const startYearForm = document.getElementById('event_start_date_1i');
    const endYearForm = document.getElementById('event_end_date_1i');
    const startMonthForm = document.getElementById('event_start_date_2i');
    const endMonthForm = document.getElementById('event_end_date_2i');
    const startDayForm = document.getElementById('event_start_date_3i');
    const endDayForm = document.getElementById('event_end_date_3i');
    let yearValue = startYearForm.value;
    endDayForm.value = dayValue
    let monthValue = startMonthForm.value;
    endDayForm.value = dayValue
    let dayValue = startDayForm.value;
    endDayForm.value = dayValue
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
  })
}
