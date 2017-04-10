function im_result=apply_effect(im,effect)

	[w,h]=size(im);
            
           
	if(h>28)
		subtract=h-28;      
        	
		for (k=1:subtract)
	        	
			if(mod(k,2)==1)
        	        	im=im(:,1:end-1);
                        
			else
				im=im(:,2:end);
			end
		end
	end
         
	if(w>28)
		subtract=w-28;
		
		for (k=1:subtract)
        		
			if(mod(k,2)==1)
        			im=im(1:end-1,:);          
			else
				im=im(2:end,:);
			end
        	end
	end

        if((w>=28) && (h<28))
       	
 		subtract=28-h;
                more_pixels=zeros(28,subtract);
                im=horzcat(im,more_pixels);
                disp('pixels added in image width');
        end

        if((h>=28) && (w<28))
        
 		subtract=28-w;
                more_pixels=zeros(subtract,28);
                im=vertcat(im,more_pixels);
                disp('pixels added in image height');

         end


         if((h<28) && (w<28))

         	subtract=28-h;
         	more_pixels=zeros(28,subtract);
         	im=horzcat(im,more_pixels);
         	subtract=28-w;
         	more_pixels=zeros(subtract,28);
         	im=vertcat(im,more_pixels);
         	disp('Imagem bem pequena! pixels colocados em ambos os lados');
         end


	if (strcmp(effect,'median')==1)

		MedianBlur=medfilt2(im,[3 3]);
	        im_result=im-MedianBlur;	

	else
		if (strcmp(effect,'average')==1)

			H = fspecial('average', [3 3]);
	    		AverageBlur = imfilter(im,H);
	    		im_result=im-AverageBlur;
		else
			im_result=im;
		end
	end


	            

end
