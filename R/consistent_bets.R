library("readr")
football = read_csv("data/football_data.csv")
library("dplyr")

consistent_bets = function(team = "All", result, stake) {
  if(team != "All") {
    home_away = readline(glue::glue("Do you wish to track all, just home or just away of {team}'s results"))
  } else {
    home_away = NULL
  }
  football %>%
    team_tracker(team, home_away) %>%
    select(FTR, B365H, B365D, B365A) %>%
    mutate(Stake = stake) %>%
    mutate(Win = ifelse(FTR == result, TRUE, FALSE)) %>%
    win_loss(result) %>%
    summarise(Total_net_gain = sum(Net_gain))
}
