function [choice, reward, values] = simulate_simple_rl(reward_prob, alpha, beta) 
values = [.5 .5];


for trial = 1:length(reward_prob)
    %probability of choosing left
    p_left = 1/(1+exp((beta*(values(trial, 1)-values(trial, 2)))));
    
    %make choice based on p_left
    choice(trial) = (p_left>rand)+1;
    
    %receive reward based on choice
    reward(trial) = (reward_prob(trial, choice(trial))>rand);
    
    %update chosen value with delta rule and leave unchoosen value
    %unchanged
    values(trial+1, :) = values(trial, :);
    values(trial+1, choice(trial)) = values(trial, choice(trial)) + alpha*(reward(trial)-values(trial, choice(trial)));   
end
end