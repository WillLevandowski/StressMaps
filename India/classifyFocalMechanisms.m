function [type,SH]=classifyFocalMechanisms(Ptr,Ppl,Ttr,Tpl,Ntr,Npl,mechs)
NF=find(Ppl>52 & Tpl<35);
 NS=find(Ppl>40 & Ppl<52 & Tpl<20);
 SS1=find(Ppl<40 & Npl>45 & Tpl<20);
 SS2=find(Ppl<20 & Npl>45 & Tpl<40);
 TS=find(Ppl<20 & Tpl<52 & Tpl>40);
 TF=find(Ppl<35 & Tpl>52);
type=0*Ptr;
type(NF)=0.5;
type(NS)=1;
type(SS1)=1.5;
type(SS2)=1.5;
type(TS)=2;
type(TF)=2.5;
SS=find(Ppl<20 & Npl>45 & Tpl<20 & type==0);type(SS)=1.5;

SH=Ptr;
SH(NF)=Ntr(NF);
SH(NS)=Ttr(NS)+90;
SH(SS1)=Ttr(SS1)+90;
% SH(SS1A)=Ttr(SS1A)+90;
SH(SH>360)=SH(SH>360)-360;
SH(type==0)=999;

% a=find(type==0);
% for i=1:length(a)
%     b=a(i);
%      %%% unclassified events
%      %%% what is SH? Ptr, Ntr, or Ttr+90
%      SH1=mod(Ptr(b),180);
%      SH2=mod(Ntr(b),180);
%      SH3=mod(Ttr(b)+90,180);
%     
% %     mechs(b,1:6)
% %     [Ppl(b) Tpl(b) Npl(b)]
% %     [Ptr(b) Ttr(b) Ntr(b)]
% %     [SH1 SH3 SH2 ]
%     
%     
%     if Npl(b)<Ppl(b) && Npl(b)<Tpl(b) 
%         SH(b)=SH2;
%         type(b)=1.5;
%     end
%     
%      if Tpl(b)<Npl(b)+5 && Tpl(b)<Ppl(b)  
%         SH(b)=SH3;
%         type(b)=1.5;
%     end
%     if Ppl(b)<40 && Ppl(b)<Tpl(b) 
%         SH(b)=SH1;
%         type(b)=1.5;
%     end
%    
%     if Ppl(b)<Npl(b)+5 && Ppl(b)==Tpl(b) 
%         SH(b)=SH1;
%         
%         if abs(SH3-80)<abs(SH1-80)
%             SH(b)=SH3;
%         end
%         type(b)=1.5;
%     end
%    
%     
% %    disp([b SH(b)])
% end
% % 
% % SS1A=[];SS2A=[];
% % 
% % addSS1A=find (type==0 & Npl>Tpl & Npl>Ppl & mechs(:,3)<0 & mechs(:,6)<0);
% % SS1A=[SS1A;addSS1A];type(addSS1A)=1.25;
% % 
% % addSS2A=find (type==0 & Npl>Tpl & Npl>Ppl & mechs(:,3)>0 & mechs(:,6)>0);
% % SS2A=[SS2A;addSS2A];type(addSS2A)=1.75;
% % 
% % addSS=find (type==0 & Npl>Tpl & Npl>Ppl & mechs(:,3).*mechs(:,6)<0 );
% % SS=[SS;addSS];type(addSS)=1.5;
% % 
% % 
% % addTS=find (type==0 & Tpl>Npl & Tpl>Ppl);TS=[TS;addTS];type(addTS)=2.0;
% % % addNF=find (type==0 & Ppl>Npl & Ppl>Tpl & mechs(:,3)<0 & mechs(:,6)<0);NF=[NF;addNF];type(addNF)=0.5;
% % addNS=find (type==0 & Ppl>Npl & Ppl>Tpl);NS=[NS;addNS];type(addNS)=1.0;
% % 






 