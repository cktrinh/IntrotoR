# model variables
gbl_initial_pop_toadstools <- 500 # initial population of toadstools
gbl_chance_faerie <- 0.8          # the chance a toadstool will create a faerie in the spring
gbl_num_seeds_per_faerie <- 2     # the number of seeds a faerie can carry
gbl_chance_seed <- 0.7            # the chance a seed will germinate
gbl_hard_winter <- 0.7            # the percent of seeds that survive a hard winter
gbl_mild_winter <- 0.9            # the percent of seeds that survive a mild winter
gbl_max_toadstools <- 1000        # the max number of toadstools (carrying capacity)
gbl_min_toadstools <- 10          # the minimum number of toadstools for a viable population

# simulation variables
gbl_NSims <- 100                  # number of simulations to execute
gbl_NYears <- 200                 # number of years to simulation
gbl_chance_of_hard_winter = c( 1/10.0, 1/9.0, 1/8.0, 1/7.0, 1/6.0, 1/5.0, 1/4.0, 1/3.0 )

# Part 2
simYear <- function(num_toadstools,hard_winter_chance) {
  num_faeries <- num_toadstools*gbl_chance_faerie
  num_seeds <- num_faeries*gbl_num_seeds_per_faerie
  this_year <- runif(1)
  if(this_year < hard_winter_chance)
    spring_toadstools <- num_seeds*gbl_hard_winter*gbl_chance_seed
  else
    spring_toadstools <- num_seeds*gbl_mild_winter*gbl_chance_seed
  
  if(spring_toadstools > gbl_max_toadstools)
    spring_toadstools <- gbl_max_toadstools
  if(spring_toadstools < gbl_min_toadstools)
    spring_toadstools <- 0
  
  return(spring_toadstools)
}
print( simYear( 500, 1.0 ) )
print( simYear( 500, 0.0 ) )

# Part 3
runSim <- function(num_years, chance_hard_winter) {
  year_results <- double(length(num_years))
  pop_toadstools <- gbl_initial_pop_toadstools
  
  for(i in 1:num_years) {
    pop_toadstools <- simYear(pop_toadstools,chance_hard_winter)
    year_results[i] <- pop_toadstools
  }
 
  return(year_results)
}
print( round(runSim( 10, 0.0 ),0) )
print( round(runSim( 10, 1.0 ),0) )
set.seed(42)
print( round(runSim( 10, 0.2 ),0) )

# Part 4
runManySims <- function( num_sims, num_years, chance) {
  results <-  matrix(ncol=num_years, nrow=num_sims)
  for( i in 1:num_sims) {
   results[i,] <- runSim(num_years, chance)
  }
  prob_of_survival <- double(length(num_years))
  for(i in 1:num_years) {
    prob_of_survival[i] <- sum(results[,i] > 0)/num_sims
  }
  return(prob_of_survival)
}

set.seed(42)
print( round( runManySims( 100, 30, 0.5 ), 2 ) )

# Part 5
calcProbSurvival <- function( num_sims, num_years, chance_values ) {
  prob_survival <- matrix(nrow=num_years,ncol=length(chance_values))
  cur_col <- 1
  for(chance in chance_values) {
    prob_survival[,cur_col] <- runManySims(num_sims,num_years,chance)
    cur_col <- cur_col + 1
  }
  return(prob_survival)
}
all_results <- calcProbSurvival( gbl_NSims, gbl_NYears, gbl_chance_of_hard_winter )
image(x=1:gbl_NYears, y=gbl_chance_of_hard_winter,z=all_results, xlab="Number of Years to Simulation", ylab="Percent of seeds that survive a hard winter", main="Probability of survival of seeds over years affected by hard winters")
