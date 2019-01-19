% To run GOA: [Best_score,Best_pos,GOA_cg_curve]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)

clear all 
clc

SearchAgents_no=100; % Number of search agents

Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Target_score,Target_pos,GOA_cg_curve, Trajectories,fitness_history, position_history]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

figure('Position',[454   445   894   297])
%Draw search space
subplot(1,5,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
box on
axis tight

subplot(1,5,2);
hold on
for k1 = 1: size(position_history,1)
    for k2 = 1: size(position_history,2)
        plot(position_history(k1,k2,1),position_history(k1,k2,2),'.','markersize',1,'MarkerEdgeColor','k','markerfacecolor','k');
    end
end
plot(Target_pos(1),Target_pos(2),'.','markersize',10,'MarkerEdgeColor','r','markerfacecolor','r');
title('Search history (x1 and x2 only)')
xlabel('x1')
ylabel('x2')
box on
axis tight

subplot(1,5,3);
hold on
plot(Trajectories(1,:));
title('Trajectory of 1st grasshopper')
xlabel('Iteration#')
box on
axis tight

subplot(1,5,4);
hold on
plot(mean(fitness_history));
title('Average fitness of all grasshoppers')
xlabel('Iteration#')
box on
axis tight

%Draw objective space
subplot(1,5,5);
semilogy(GOA_cg_curve,'Color','r')
title('Convergence curve')
xlabel('Iteration#');
ylabel('Best score obtained so far');
box on
axis tight
set(gcf, 'position' , [39         479        1727         267]);


display(['The best solution obtained by GOA is : ', num2str(Target_pos)]);
display(['The best optimal value of the objective funciton found by GOA is : ', num2str(Target_score)]);
