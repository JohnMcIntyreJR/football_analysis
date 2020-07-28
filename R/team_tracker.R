team_tracker = function(data, team, home_away) {
  if(team == "All") {
    data
  } else {
    if(home_away == "Both") {
      data %>%
        filter(HomeTeam == team | AwayTeam == team)
      data
    } else if(home_away == "Home") {
      data %>%
        filter(HomeTeam == team)
      data
    } else if(home_away == "Away") {
      data %>%
        filter(AwayTeam == team)
      data
    }
  }
}
