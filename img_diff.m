function dimg = img_diff( img1 , img2 )
%IMG_DIFF berechnet und optimiert ein binaeres Differenzbild.
%   Eingabe: zwei Bilder von derselben Kamera; img2 mit einem Pfeil mehr
%   Ausgabe: ein optimiertes binaeres Differenzbild

    diff = imabsdiff(img1,img2);    % erstellt das Differenzbild
    bw = im2bw(diff, 0.1);          % konvertiert das Differenzbild in ein binaeres Bild; alle Pixel >0.1 werden weiss - Rest schwarz
    dimg = bwareaopen(bw,400);      % entfernt alle Pixelansammlungen <400 Pixel
end