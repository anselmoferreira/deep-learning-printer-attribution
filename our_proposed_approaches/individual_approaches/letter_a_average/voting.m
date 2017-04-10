function classes_final=voting(PrtsAttrib,num_char_per_document_test)

	classes_final=zeros(1, size(num_char_per_document_test,2));
	index=1;

	for i=1:size(num_char_per_document_test,2)

    		if(i==1)
        		votes_vector=PrtsAttrib(index:index+num_char_per_document_test(i));
        		classes_final(i)=mode(votes_vector);
        		index=index+num_char_per_document_test(i);
    		else
			votes_vector=PrtsAttrib(index:index+num_char_per_document_test(i)-1);
        		classes_final(i)=mode(votes_vector);
        		index=index+num_char_per_document_test(i);
    		end
	end

end

