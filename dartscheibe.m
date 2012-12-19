%Dieses Programm zeichnet eine Dartscheibe. 

x=-17:0.00001:17;
y=sqrt(17^2-x.^2);
plot(x,y,'Color',[.5 .5 .5]) %oberer Halbkreis aeusserer Doublering
if ishold == 0                %Wenn hold-Modus noch nicht aktiviert ist, wird er es jetzt --> vollstaendige Dartscheibe
    hold; 
end;

y=-sqrt(17^2-x.^2); %unterer Halbkreis äußerer Doublering 
plot(x,y,'Color',[.5 .5 .5])


x=-16.2:0.00001:16.2;
y=sqrt(16.2^2-x.^2);
plot(x,y,'Color',[.5 .5 .5]) %oberer Halbkreis innerer Doublering


y=-sqrt(16.2^2-x.^2);
plot(x,y,'Color',[.5 .5 .5]) %unterer Halbkreis innerer Doublering


x=-10.7:0.00001:10.7;
y=sqrt(10.7^2-x.^2);
plot(x,y,'Color',[.5 .5 .5])   %oberer Halbkreis �u�erer Triplering


y=-sqrt(10.7^2-x.^2);
plot(x,y,'Color',[.5 .5 .5])   %unterer Halbkreis �u�erer Triplering


x=-9.9:0.00001:9.9;
y=sqrt(9.9^2-x.^2);
plot(x,y,'Color',[.5 .5 .5])    %oberer Halbkreis innerer Triplering


y=-sqrt(9.9^2-x.^2); 
plot(x,y,'Color',[.5 .5 .5])    %unterer Halbkreis innerer Triplering


x=-1.59:0.00001:1.59;
y=sqrt(1.59^2-x.^2);
plot(x,y,'Color',[.5 .5 .5])    %oberer Halbkreis �u�erer Bullring

y=-sqrt(1.59^2-x.^2);
plot(x,y,'Color',[.5 .5 .5])     %unterer Halbkreis �u�erer Bullring 

x=-0.635:0.00001:0.635;
y=sqrt(0.635^2-x.^2); 
plot(x,y,'Color',[.5 .5 .5])     %oberer Halbkreis innerer Bullring (bzw. �u�erer Bulls' Eye-Ring)

y=-sqrt(0.635^2-x.^2);
plot(x,y,'Color',[.5 .5 .5])     %unterer Halbkreis innerer Bullring (bzw. �u�erer Bulls' Eye-Ring)



sigma=9*(pi/180); %Gr��e des Kippwinkels 

for i=0:1:9 %Zeichnen der Segmentbegrenzungen 
    x=17*cos((pi/2)-(sigma+2*i*sigma));
    y=17*sin((pi/2)-(sigma+2*i*sigma));
    line([x,17*cos((pi/2)-(sigma+2*i*sigma)+pi)],[y,17*sin((pi/2)-(sigma+2*i*sigma)+pi)],'Color','black')
    
    
end


text(-0.5,18,'20')                          % Beschriftung der Segmente durch Text
text(5,17.5,'1')
text(10,15,'18')
text(15,10.5,'4')
text(16.5,6,'13')
text(18,0,'6')
text(17,-5.5,'10')
text(14.5,-10.5,'15')
text(10.5,-15,'2')
text(5.25,-17.25,'17')
text(-0.5,-18,'3')
text(-5.75,-17.25,'19')
text(-10,-15,'7')
text(-15,-11,'16')
text(-17.5,-5.5,'8')
text(-18.5,0,'11')
text(-17.5,6,'14')
text(-15,10.5,'9')
text(-10.5,15,'12')
text(-5.5,17.5,'5')

hold;                                       % Aufheben des hold-Modus
axis equal;                                 % gleiche Einteilung der Achsen