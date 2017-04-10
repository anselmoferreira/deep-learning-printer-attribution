function accuracy_documents=write_confusion_matrix(predict, groundtruth, table_name)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

confusion=zeros(10,10);

for i=1:size(predict,2)

    confusion(groundtruth(1,i), predict(1,i))=confusion(groundtruth(1,i), predict(1,i))+1;

end


	soma=0;
	total_matriz=sum(confusion(:));
	total_diagonal=0;
	
	for j=1:size(confusion,1)
		
		total_diagonal=total_diagonal+confusion(j,j);
	end
	accuracy_documents=(total_diagonal/total_matriz)*100;




disp(confusion);
dlmwrite(table_name,confusion);

end

