const calculateTotalCost = () => {
  const headCount = document.querySelector('.booking_headcount')
  let string_cost = document.querySelector("#tour_cost")
  const num_cost = parseInt(string_cost.innerText)


  if (headCount) {
    headCount.addEventListener('change',(event) => {
      const string_count = headCount.childNodes[1].value
      const num_count = parseInt(string_count, 10)
      string_cost.innerText = num_cost * num_count
    })
  }
}

export { calculateTotalCost };
