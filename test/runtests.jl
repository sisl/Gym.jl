using Gym
using Base.Test

function sim(env, nsteps=100, rng=MersenneTwister())
    step = 1
    done = false
    r_tot = 0.0
    start_monitor(env, string("exp-", env.name))
    o = reset(env)
    na = n_actions(env)
    dims = obs_dimensions(env)
    while !done && step <= nsteps
        action = sample_action(env)
        obs, rew, done, info = step!(env, action)
        #println(obs, " ", rew, " ", done, " ", info)
        r_tot += rew
        step += 1
    end
    close_monitor(env)
    return r_tot
end

envs = [GymEnvironment("Breakout-v0")]

for env in envs
    r = sim(env)
end 
