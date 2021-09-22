classdef Wave < handle
    %CLASSTEST Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        theta;
        c;
        lambda;
        k;
        omega;
        type;
        sigma
        f;
        x0;
        y0;
        A;
    end
    
    methods
        function obj = Wave(theta, c, lambda, type)
            %WAVE Construct an instance of this class
            %   Detailed explanation goes here
            obj.theta = theta;
            obj.c = c;
            obj.lambda = lambda;
            obj.k = 2*pi/lambda;
            obj.omega = c*obj.k;
            obj.sigma = 1;
            obj.x0 = 0;
            obj.y0 = 0;
            obj.type = type;
            obj.A = 1;
            
            refreshmesh(obj);
        end
        
        function set.lambda(obj,lambda)
            obj.lambda = lambda;
            obj.k = 2*pi/lambda;
            obj.omega = obj.c*obj.k;
        end
        
        function r = plus(obj1,obj2)
            r = @(t, xx, yy) obj1.f(t, yy, xx) + obj2.f(t, yy, xx);
        end
        
        function refreshmesh(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            switch obj.type
                case 'Plane wave'
                    obj.f = @(t, yy, xx) obj.A .* cos((obj.k*(xx*cos(obj.theta)+yy*sin(obj.theta))-obj.omega*t));
                case 'Gaussian'
                    obj.f = @(t, yy, xx) obj.A .*exp(-(sin(obj.theta)*(xx-obj.x0) + cos(obj.theta)*(yy-obj.y0)).^2/(2*obj.sigma.^2)) .* exp(-1i*(obj.k*((xx-obj.x0)*cos(obj.theta)-(yy-obj.y0)*sin(obj.theta))-obj.omega*t));
                case 'Cylindrical'
                    rho = @(yy, xx) sqrt((xx-obj.x0).^2+(yy-obj.y0).^2);
                    obj.f = @(t, yy, xx) 1./sqrt(1+rho(yy, xx)) .* obj.A .* exp(-1i*(obj.k*(rho(yy, xx))-obj.omega*t));
                otherwise
                    error('Wave type unrecognized');
            end
        end
        
        
    end
end

