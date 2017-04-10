function [classes_train, features_train, classes_test, features_test]=features_vector_generator(imdb,net,fold)
	
	disp('Generating Training Feature Vectors...');
    	net.layers = net.layers(1:7);
    	features_train=zeros(1,500);
   	
	train_images=single(imdb.images.data(:,:,:,imdb.images.set==1));
   	batch_size=100;
   	index=1;
   
   	if(mod(size(train_images,4),batch_size)==0)
   		max_iterations=size(train_images,4)/batch_size;
   	else
        	max_iterations=(size(train_images,4)/batch_size)+1;
   	end

	for i=1:max_iterations
        	if(i==1)
        		batch_train_images=train_images(:,:,:,index:batch_size);
        		index=index+batch_size;
        		res_train=vl_simplenn(net,batch_train_images)';   
        		features_train=vertcat(features_train,squeeze(res_train(7).x)');
		else
                	if(index+batch_size-1>size(train_images,4))
                		batch_train_images=train_images(:,:,:,index:end);
        	        	res_train=vl_simplenn(net,batch_train_images)';   
        	        	features_train=vertcat(features_train,squeeze(res_train(7).x)');
                
                	else
				batch_train_images=train_images(:,:,:,index:index+batch_size-1);
        			index=index+batch_size;
        			res_train=vl_simplenn(net,batch_train_images)';   
        			features_train=vertcat(features_train,squeeze(res_train(7).x)');
                	end  
		end
   	end

     
   	classes_train=imdb.images.labels(imdb.images.set==1)';
   	clearvars -except net imdb fold char_per_document_test ground_truth_documents_test batch_size classes_train features_train
       	features_test=zeros(1,500);
   
        disp('Generating Testing Feature Vectors...');
   	%features de treino pego ao aplicar somente as imagens de teste no simplenn
   	test_images=single(imdb.images.data(:,:,:,imdb.images.set==3));
   	index=1;

   	if(mod(size(test_images,4),batch_size)==0)
   		max_iterations=size(test_images,4)/batch_size;
   	else
        	max_iterations=(size(test_images,4)/batch_size)+1;
   	end
   
   	for i=1:max_iterations
        
        	if(i==1)
        		batch_test_images=test_images(:,:,:,index:batch_size);
        		index=index+batch_size;
        		res_test=vl_simplenn(net,batch_test_images)';   
        		features_test=vertcat(features_test,squeeze(res_test(7).x)');
		else

                	if(index+batch_size-1>size(test_images,4))
                		batch_test_images=test_images(:,:,:,index:end);
        	        	res_test=vl_simplenn(net,batch_test_images)';   
        	        	features_test=vertcat(features_test,squeeze(res_test(7).x)');
                
                	else

				batch_test_images=test_images(:,:,:,index:index+batch_size-1);
        			index=index+batch_size;
        			res_test=vl_simplenn(net,batch_test_images)';   
        			features_test=vertcat(features_test,squeeze(res_test(7).x)');
                	end  
		end
   	end

   	classes_test=imdb.images.labels(imdb.images.set==3)';
