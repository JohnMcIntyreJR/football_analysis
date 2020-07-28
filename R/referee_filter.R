referee_filter = function(data, ref = "All") {
  if(ref != "All") {
    data = data %>%
      filter(Referee == ref)
  }
  data
}
m_dean = football %>%
  filter(Referee == "M Dean")
