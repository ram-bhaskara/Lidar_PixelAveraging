%% 3*3 Grid average 
% 9*9 pixel mask
% inputs (x,y,z) terrain data, (u,v) which are fractional data
% outputs (x,y,z) data obtained from pixel averaging 

% clc;
% global u v d
%  x = randn(3,3);
%   y = randn(3,3);
%    z = randn(3,3);
%    u1=2.2; v1= 2.4;
%    ans = Grid_3by3(x,y,z,u1,v1)
%    u 
%    v

function pxl_avg_coords = PixelAverage_grid3by3(x,y,z,u1,v1)
    uf = floor(u1); vf = floor(v1);
    
    uc = ceil(u1); vc = ceil(v1);
    
    % assign pixel center by computing minimum distance between (u,v) and
    % possible centers
    
    [u_cen,v_cen] = min_distance(u1,v1,uf,vf,uc,vc);
    
    u_m = u_cen-1; v_m = v_cen-1;
    u_p = u_cen+1; v_p = v_cen+1;
    
    pxl_avg_coords = zeros(3,1);
    
    pxl_avg_coords(1) = (1/9)*(x(u_m,v_m)+x(u_cen,v_m)+x(u_p,v_m)+x(u_m,v_cen)+x(u_cen,v_cen)+x(u_p,v_cen)+x(u_m,v_p)+x(u_cen,v_p)+x(u_p,v_p));
    pxl_avg_coords(2) = (1/9)*(y(u_m,v_m)+y(u_cen,v_m)+y(u_p,v_m)+y(u_m,v_cen)+y(u_cen,v_cen)+y(u_p,v_cen)+y(u_m,v_p)+y(u_cen,v_p)+y(u_p,v_p));
    pxl_avg_coords(3) = (1/9)*(z(u_m,v_m)+z(u_cen,v_m)+z(u_p,v_m)+z(u_m,v_cen)+z(u_cen,v_cen)+z(u_p,v_cen)+z(u_m,v_p)+z(u_cen,v_p)+z(u_p,v_p));
end

function [u,v] = min_distance(u1,v1,uf,vf,uc,vc)
%     global u v d
    d = zeros(4,1);
    d(1) = (u1-uf)^2+(v1-vf)^2;
    d(2) = (u1-uf)^2+(v1-vc)^2;
    d(3) = (u1-uc)^2+(v1-vf)^2;
    d(4) = (u1-uc)^2+(v1-vc)^2;
    
    min_dis = min(d);
    
    if min_dis ==d(1)
        u=uf; v=vf;
    elseif min_dis == d(2)
        u=uf; v=vc;
    elseif min_dis == d(3)
        u=uc; v=vf;
    elseif min_dis == d(4)
        u=uc; v=vc;
    end
    
end