
win_loss = function(data, result) {
  if(result == "H") {
    data %>%
      mutate(Net_gain = ifelse(Win == TRUE, (B365H * Stake) - 10, -Stake))
  } else if(result == "D") {
    data %>%
      mutate(Net_gain = ifelse(Win == TRUE, (B365D * Stake) - 10, -Stake))
  } else {
    data %>%
      mutate(Net_gain = ifelse(Win == TRUE, (B365A * Stake) - 10, -Stake))
  }
}
