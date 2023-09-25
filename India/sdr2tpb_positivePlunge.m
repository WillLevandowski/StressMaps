function [t,p,b,Ptr,Ppl,Ttr,Tpl,Ntr,Npl]=sdr2tpb_positivePlunge(strike,dip,rake)
%SDR2TPB    Returns the principal axes of a focal mechanism
%
%    Usage:    [t,p,b]=sdr2tpb(sdr)
%              [t,p,b]=sdr2tpb(strike,dip,rake)
%
%    Description:
%     [T,P,B]=SDR2TPB(SDR) gives the principal axes (tension, compression,
%     and null) of the focal mechanism(s) in SDR.  SDR must be a Nx3 array
%     formatted as [strike dip rake] where N allows for multiple focal
%     mechanisms to be processed simultaneously.  Strike is clockwise from
%     North, dip is positive downward from the horizontal and rake is
%     counter-clockwise in the fault plane from the strike direction.  Note
%     that the strike must be such that when you look along the direction
%     of the strike the fault dips to your right.  T, P, & B are Nx3 arrays
%     of [value plunge azimuth] where plunge & azimuth are in degrees and
%     value is always 1.
%
%     [T,P,B]=SDR2TPB(STRIKE,DIP,RAKE) lets strike, dip & rake be given
%     separately.
%
%    Notes:
%
%    Examples:
%     % Where are the tension and compression axes for a North striking
%     % fault with 60deg dip and a rake of 45deg?
%     [t,p]=sdr2tpb(0,60,45)
%
%    See also: TPB2SDR, STRIKEDIP2NORM, NORM2STRIKEDIP, SDR2SLIP, SDR2NULL,
%              NORMSLIP2SDR, NEU2VPA, VPA2NEU, NODALLINES, MT2TPB, TPB2MT

%     Version History:
%        Mar. 17, 2013 - initial version
%
%     Written by Garrett Euler (ggeuler at wustl dot edu)
%     Last Updated Mar. 17, 2013 at 15:05 GMT

% todo:

% check nargin
narginchk(1,3);

% one or both inputs
switch nargin
    case 1
        if(size(strike,2)~=3 || ndims(strike)>2)
            error('seizmo:sdr2tpb:badInput',...
                'SDR must be a Nx3 array as [STRIKE DIP RAKE] !');
        elseif(~isnumeric(strike) || ~isreal(strike))
            error('seizmo:sdr2tpb:badInput',...
                'SDR must be a real-valued Nx3 array!');
        end
        [strike,dip,rake]=deal(strike(:,1),strike(:,2),strike(:,3));
    case 3
        if(~isnumeric(strike) || ~isreal(strike) ...
                || ~isnumeric(dip) || ~isreal(dip) ...
                || ~isnumeric(rake) || ~isreal(rake))
            error('seizmo:sdr2tpb:badInput',...
                'STRIKE/DIP/RAKE must be real-valued arrays!');
        end
        [strike,dip,rake]=expandscalars(strike,dip,rake);
    otherwise
        error('seizmo:sdr2tpb:badNumInputs',...
            'Incorrect number of inputs (only 1 or 3)!');
end

% get normal/slip vectors to calculate tension & pressure axes
normal=strikedip2norm(strike,dip);
slip=sdr2slip(strike,dip,rake);

% tension & pressure axes (in value/plunge/azimuth)
% t = n + s
% p = n - s
t=neu2vpa(normal+slip);
p=neu2vpa(normal-slip);
t(:,1)=1; p(:,1)=1;

% null axis in value/plunge/azimuth
b=neu2vpa(sdr2null(strike,dip,rake));

% for i=1:length(t(:,1))
% 
%     if t(i,2)<0;t(i,3)=t(i,3)-90;t(i,2)=-t(i,2);end
%     if t(i,3)<0;t(i,3)=t(i,3)+360;end
%     if p(i,2)<0;p(i,3)=p(i,3)-90;p(i,2)=-p(i,2);end
%     if p(i,3)<0;p(i,3)=p(i,3)+360;end
%     if b(i,2)<0;b(i,3)=b(i,3)-90;b(i,2)=-b(i,2);end
%     if b(i,3)<0;b(i,3)=b(i,3)+360;end
%     
%     
% 
% end
 Ptr=p(:,3);Ttr=t(:,3);Ntr=b(:,3);Ppl=p(:,2);Tpl=t(:,2);Npl=b(:,2);
 Ptr(Ppl<0)=Ptr(Ppl<0)-180;Ppl=abs(Ppl);
 Ttr(Tpl<0)=Ttr(Tpl<0)-180;Tpl=abs(Tpl);
 Ntr(Npl<0)=Ntr(Npl<0)-180;Npl=abs(Npl);
  Ptr(Ptr<0)=Ptr(Ptr<0)+360;
 Ttr(Ttr<0)=Ttr(Ttr<0)+360;
 Ntr(Ntr<0)=Ntr(Ntr<0)+360;
 
end