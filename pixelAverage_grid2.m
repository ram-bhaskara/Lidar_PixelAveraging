%% Pixel map averaging 2*2 grid of surrounding pixels (selective grid)
% 
% inputs (x,y,z) terrain data, (u,v) which are fractional data
% outputs (x,y,z) data obtained from pixel averaging 

% clc; close all; clear all;
% global u v d
%  x = eye(3,3);
%   y = eye(3,3);
%    z = eye(3,3);
%    u1=2.2; v1= 2.4;
%    ans = pixelAverage_grid2(x,y,z,u1,v1)
%    u 
%    v

function pxl_avg_coords = pixelAverage_grid2(x,y,z,u1,v1)
%     global u v
    uf = floor(u1); vf = floor(v1);
    
    uc = ceil(u1); vc = ceil(v1);
    
    % assign center pixel by computing minimum distance between (u,v) and
    % possible centers
    
    d = zeros(4,1);
    d(1) = (u1-uf)^2+(v1-vf)^2; %quadrant (1,1) of the square (left, up)
    d(2) = (u1-uf)^2+(v1-vc)^2; %quadrant (2,1) of the square (left, down)
    d(3) = (u1-uc)^2+(v1-vf)^2; %quadrant (1,2) of the square (right, up)
    d(4) = (u1-uc)^2+(v1-vc)^2; %quadrant (2,2) of the square (right, down)
    
    min_dis = min(d);
    
    if min_dis == d(1)
        u=uf; v=vf;
        pxl_avg_coords(1) = 0.25*(x(u,v)+x(u-1,v-1)+x(u+1,v-1)+x(u-1,v+1));
        pxl_avg_coords(2) = 0.25*(y(u,v)+y(u-1,v-1)+y(u+1,v-1)+y(u-1,v+1));
        pxl_avg_coords(3) = 0.25*(z(u,v)+z(u-1,v-1)+z(u+1,v-1)+z(u-1,v+1));
        
    elseif min_dis == d(2)
        u=uf; v=vc;
        pxl_avg_coords(1) = 0.25*(x(u,v)+x(u-1,v)+x(u-1,v+1)+x(u,v+1));
        pxl_avg_coords(2) = 0.25*(y(u,v)+y(u-1,v)+y(u-1,v+1)+y(u,v+1));
        pxl_avg_coords(3) = 0.25*(z(u,v)+z(u-1,v)+z(u-1,v+1)+z(u,v+1));
        
    elseif min_dis == d(3)
        u=uc; v=vf;
        pxl_avg_coords(1) = 0.25*(x(u,v)+x(u,v-1)+x(u+1,v)+x(u+1,v-1));
        pxl_avg_coords(2) = 0.25*(y(u,v)+y(u,v-1)+y(u+1,v)+y(u+1,v-1));
        pxl_avg_coords(3) = 0.25*(z(u,v)+z(u,v-1)+z(u+1,v)+z(u+1,v-1));
          
    elseif min_dis == d(4)
        u=uc; v=vc;
        pxl_avg_coords(1) = 0.25*(x(u,v)+x(u+1,v)+x(u,v+1)+x(u+1,v+1));
        pxl_avg_coords(2) = 0.25*(y(u,v)+y(u+1,v)+y(u,v+1)+y(u+1,v+1));
        pxl_avg_coords(3) = 0.25*(z(u,v)+z(u+1,v)+z(u,v+1)+z(u+1,v+1));
    end
end

% function [u,v] = min_distance(u1,v1,uf,vf,uc,vc)
% %     global u v d
%     d = zeros(4,1);
%     d(1) = (u1-uf)^2+(v1-vf)^2; %quadrant (1,1) of the square (left, up)
%     d(2) = (u1-uf)^2+(v1-vc)^2; %quadrant (2,1) of the square (left, down)
%     d(3) = (u1-uc)^2+(v1-vf)^2; %quadrant (1,2) of the square (right, up)
%     d(4) = (u1-uc)^2+(v1-vc)^2; %quadrant (2,2) of the square (right, down)
%     
%     min_dis = min(d);
%     
%     if min_dis ==d(1)
%         u=uf; v=vf;
%         pxl_avg_coords(1) = 0.25*(x(u,v)+x(u-1,v-1)+x(u+1,v-1)+x(u-1,v+1));
%         pxl_avg_coords(2) = 0.25*(y(u,v)+y(u-1,v-1)+y(u+1,v-1)+y(u-1,v+1));
%         pxl_avg_coords(3) = 0.25*(z(u,v)+z(u-1,v-1)+z(u+1,v-1)+z(u-1,v+1));
%         
%     elseif min_dis == d(2)
%         u=uf; v=vc;
%         pxl_avg_coords(1) = 0.25*(x(u,v)+x(u-1,v)+x(u-1,v+1)+x(u,v+1));
%         pxl_avg_coords(2) = 0.25*(y(u,v)+y(u-1,v)+y(u-1,v+1)+y(u,v+1));
%         pxl_avg_coords(3) = 0.25*(z(u,v)+z(u-1,v)+z(u-1,v+1)+z(u,v+1));
%         
%     elseif min_dis == d(3)
%         u=uc; v=vf;
%         pxl_avg_coords(1) = 0.25*(x(u,v)+x(u,v-1)+x(u+1,v)+x(u+1,v-1));
%         pxl_avg_coords(2) = 0.25*(y(u,v)+y(u,v-1)+y(u+1,v)+y(u+1,v-1));
%         pxl_avg_coords(3) = 0.25*(z(u,v)+z(u,v-1)+z(u+1,v)+z(u+1,v-1));
%           
%     elseif min_dis == d(4)
%         u=uc; v=vc;
%         pxl_avg_coords(1) = 0.25*(x(u,v)+x(u+1,v)+x(u,v+1)+x(u+1,v+1));
%         pxl_avg_coords(2) = 0.25*(y(u,v)+y(u+1,v)+y(u,v+1)+y(u+1,v+1));
%         pxl_avg_coords(3) = 0.25*(z(u,v)+z(u+1,v)+z(u,v+1)+z(u+1,v+1));
%     end
%     
% end

