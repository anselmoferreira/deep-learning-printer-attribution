function [imdb, ground_truth_documents_test, char_per_document_test] = generate_imdb(opts,fold,effect)

	%Importing information from the 5x2 validation file, which shows who will be documents from training and testing
	dataset=importdata('../../../aux/DistriDatasetsBalanceado5x2.csv');

	index_training_images=1;
	index_testing_images=1;
	index_testing_documents=1;

	char_per_document_test=zeros(1,numel(find(dataset.data(:,fold+2)==3)));
	ground_truth_documents_test=zeros(1,numel(find(dataset.data(:,fold+2)==3)));

	for i=2:size(dataset.textdata,1) %2 
   
    		document=dataset.textdata(i,1);
    		printer=dataset.textdata(i,2);
    		class=dataset.data(i-1,1);
     
    		
    		if(dataset.data(i-1,fold+2)==3)
        		ground_truth_documents_test(index_testing_documents)=class;
        		index_testing_documents=index_testing_documents+1;
    		end
    
       		letters_dir=dir(['../../../aux/letter_a_dataset/' char(printer) '/' char(document)]);
       		disp(['Adding to MDB letters from document:' int2str(i-1) ':' char(document)]);
   
        	for j=3:size(letters_dir,1)
			
            		im=imread(['../../../aux/letter_a_dataset/' char(printer) '/' char(document) '/' letters_dir(j).name]);
			
			%cropping borders (or adding zeros) to make the final image a 28x28 image used as input to the network
			%we also apply other image representation when required             
            		im=apply_effect(im, effect);

            		if(dataset.data(i-1,fold+2)==1)
                		x1(:,:,index_training_images)=im;
                		y1(index_training_images)=class;
				index_training_images=index_training_images+1;
            		end
            		
			if(dataset.data(i-1,fold+2)==3)
             			char_per_document_test(index_testing_documents-1)=char_per_document_test(index_testing_documents-1)+1;   
             			x2(:,:,index_testing_images)=im;
             			y2(index_testing_images)=class;
             			index_testing_images=index_testing_images+1;
           		end
        	end
	end
	set = [ones(1,numel(y1)) 3*ones(1,numel(y2))];
	data = single(reshape(cat(3, x1, x2),28,28,1,[]));
	dataMean = mean(data(:,:,:,set == 1), 4);
	data = bsxfun(@minus, data, dataMean);
	imdb.images.data = data;
	imdb.images.data_mean = dataMean;
	imdb.images.labels = cat(2, y1, y2);
	imdb.images.set = set;
	imdb.meta.sets = {'train', 'val', 'test'};
	imdb.meta.classes = arrayfun(@(x)sprintf('%d',x),1:10,'uniformoutput',false);
end
