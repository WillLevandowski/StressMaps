cc

invstats=[
450 2.16	0.14 28 5.8 27.7 2.31 1.8852
370 2.07	0.15 21 3.6 21.9   2.2270    1.8375
300 1.85	0.16 15 6.1 18.9   2.2372    1.7548
260 1.75	0.18 10 10.3 16.7 1.9169    1.6592
130 1.59	0.24 6  9.5 7.5 1.8514 1.4525];

figure;subplot(3,1,3);

 plot(invstats(:,1),invstats(:,6),'o-','color',[0.5 0.5 0.5],'linewidth',1.5);hold on
plot(invstats(:,1),invstats(:,5),'ko-');hold on
flipx
xlim([125 455])
ylabel('dCFS, MPa (5%)')
grid on


% yyaxis right
subplot(3,1,1);
plot(invstats(:,1),invstats(:,4),'ko-','linewidth',1);hold on
xlim([125 455])
ylabel('# Events')
flipx
grid on

subplot(3,1,2)
plot(invstats(:,1),invstats(:,2),'ko-');hold on
plot(invstats(:,1),invstats(:,7),'k+');hold on
plot(invstats(:,1),invstats(:,8),'k+');hold on
for i=1:length(invstats(:,1))
    plot([invstats(i,1) invstats(i,1)],[invstats(i,7) invstats(i,8)],'k-')
end

flipx
ylabel('A\phi')
ylim([0.5 2.5])

xlim([125 455])
grid on
saveas(gcf,'SmallerMoroccoInversions2','png')


