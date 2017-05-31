# Gym

[![Build Status](https://travis-ci.org/sisl/Gym.jl.svg?branch=master)](https://travis-ci.org/sisl/Gym.jl)

Julia wrapper for [OpenAI Gym](https://gym.openai.com/).
Similar to [this](https://github.com/tbreloff/OpenAIGym.jl) implementation, but using the [DeepRL](https://github.com/sisl/DeepRL.jl) interface to make it easy to interact with deep
reinforcement learning algorithms. 

You can run an simulation, and save the results using the following:

```julia
step = 1
done = false
r_tot = 0.0

env = GymEnvironment("Breakout-v0") # initialize the environment
start_monitor(env, string("exp-", env.name)) # saves the results in exp-Breakout-v0/
o = reset(env) # reset the environment
na = n_actions(env)                                                  
dims = obs_dimensions(env)
while !done && step <= nsteps                                       
    action = sample_action(env)                                     
    obs, rew, done, info = step!(env, action)                       
    r_tot += rew
    step += 1
end 
close_monitor(env)
```

