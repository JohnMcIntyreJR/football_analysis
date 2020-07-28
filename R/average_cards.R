library("dplyr")
average_cards = function(team = "All", ref = "All") {
  if(team != "All") {
    home_cards = football %>%
      filter(HomeTeam == team) %>%
      referee_filter(ref) %>%
      summarise(Home_cards = sum(HY))
    away_cards = football %>%
      filter(AwayTeam == team) %>%
      referee_filter(ref) %>% 
      summarise(Away_cards = sum(AY))
    total_cards = home_cards$Home_cards + away_cards$Away_cards
    team_fixtures = football %>%
      filter(HomeTeam == team | AwayTeam == team) %>%
      referee_filter(ref)
    total_games = nrow(team_fixtures)
    avg_cards = total_cards/total_games
    avg_cards
  } else {
    if(ref != "All") {
     fixtures = football %>%
       referee_filter(ref)
     total_cards = fixtures %>%
       summarise(Home_cards = sum(HY), Away_cards = sum(AY))
     total_cards = total_cards$Home_cards + total_cards$Away_cards
     total_fixtures = nrow(fixtures)
     avg_cards = total_cards/total_fixtures
     avg_cards
    }
  }
}
average_cards("All", "A Marriner")

fixtures = football %>%
  referee_filter("M Dean")
total_cards = fixtures %>%
  count(HY, AY) %>%
  rename("Home_cards" = "HY", "Away_cards" = "AY")
