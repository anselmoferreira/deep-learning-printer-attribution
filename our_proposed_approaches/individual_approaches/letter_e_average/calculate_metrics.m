function [mean_accuracy, fmeasures, precisions, recall] = calculate_metrics()

	confusion_matrices=dir('*.csv');
	accuracies=zeros(1,10);

	for i=1:size(confusion_matrices,1)

		matrix=load(confusion_matrices(i).name);
		soma=0;
		total_matrix=sum(matrix(:));
		total_diagonal=0;
	
		for j=1:size(matrix,1)
		
			total_diagonal=total_diagonal+matrix(j,j);
		end
		
		accuracies(1,i)=total_diagonal/total_matrix;
	end

	mean_accuracy=100*mean(accuracies);

	
	fmeasures=0;
	precisions=0;
	recall=0;

	for k=1:size(confusion_matrices,1)

        	precisions_vector=zeros(1,10);
        	recall_vector=zeros(1,10);
        	f_measure_vector=zeros(1,10);


		matrix2=load(confusion_matrices(k).name);


		for l=1:size(matrix2,1)
			precisions_vector(l)=matrix2(l,l)/sum(matrix2(:,l));
			recall_vector(l)=matrix2(l,l)/sum(matrix2(l,:));
			f_measure_vector(l)=2*(precisions_vector(l)*recall_vector(l))/(precisions_vector(l)+recall_vector(l));	
		end

		fmeasures=horzcat(fmeasures,f_measure_vector);
		precisions=horzcat(precisions,precisions_vector);
		recall=horzcat(recall,recall_vector);
	end
	
	dlmwrite('fmeasures.txt', fmeasures(2:end));
	dlmwrite('precisionss.txt', precisions(2:end));
	dlmwrite('recalls.txt', recall(2:end));
	dlmwrite('accuracies.txt', accuracies);

end
