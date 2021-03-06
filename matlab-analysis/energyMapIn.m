clearvars
clc
FID = fopen('energyMapIn.dat','rt');
DATA = textscan(FID,'%f %f','Headerlines',0,'CommentStyle','@')
fclose(FID);
res_num = DATA{1}(1:end-1);
res_contribution = DATA{2}(1:end-1);

FID = fopen('final_contrib_energy.dat','rt');
DATA = textscan(FID,'%s %f %f %f %f %f %f %f %f %f','Headerlines',1,'CommentStyle','@');
fclose(FID);
res_name = DATA{1}(1:end-1);
MM = DATA{2}(1:end-1);
MM_dev_error = DATA{3}(1:end-1);
Polar = DATA{4}(1:end-1);
Polar_dev_error = DATA{5}(1:end-1);
APolar = DATA{6}(1:end-1);
APolar_dev_error = DATA{7}(1:end-1);
Total = DATA{6}(1:end-1);
Total_dev_error = DATA{7}(1:end-1);

createfigure(res_num,res_contribution)
[abs_contribution,abs_res_num] = sort(abs(res_contribution),'descend');
for i = 1:6
    if res_contribution(abs_res_num(i)) > 0
        text(abs_res_num(i),res_contribution(abs_res_num(i))+3,res_name(abs_res_num(i)),'ROtation',90,'Fontsize',18)
    else
        text(abs_res_num(i),res_contribution(abs_res_num(i))-15,res_name(abs_res_num(i)),'ROtation',90,'Fontsize',18)
    end
end
function createfigure(xvector1, yvector1)

% Create figure
figure1 = figure;
set (gcf,'unit','centimeters','Position',[0,0,28,22], 'color','w')

% Create axes
axes1 = axes('Parent',figure1);

% Create bar
bar(xvector1,yvector1);
box(axes1,'off');
set(axes1,'FontSize',15);
ylim(axes1,[-40 40])
xlabel({'Residue number'});
ylabel('Contribution Energy(kJ*mol-1)');
end
