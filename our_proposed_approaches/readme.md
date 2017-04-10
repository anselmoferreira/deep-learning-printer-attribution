Source code related to our scientific paper "Data Driven Approaches for Laser Printer Attribution", published by IEEE Transactions on Information Forensics and Security.

Author: Anselmo Ferreira, Paolo Bestagini and Luca Bondi

INSTRUCTIONS

If you want to run this code, you should have MatConvnet installed. Please look at http://www.vlfeat.org/matconvnet/ for instructions

remove the following line in demo.m in order to run the code

	run('/home/anselmo/matconvnet-1.0-beta23/matlab/vl_setupnn.m');

replace it with the line below. Change the address 'where_your_matconvnet_library_is' to where your matconvnet_root folder is

	%run('where_your_matconvnet_library_is/matlab/vl_setupnn.m');

You also need to change the following lines in the following files, only if necessary:

	our_proposed_approaches/individual_approaches/letter_e_raw/main.m
	our_proposed_approaches/individual_approaches/letter_e_median/main.m
	our_proposed_approaches/individual_approaches/letter_e_average/main.m
	our_proposed_approaches/individual_approaches/letter_a_raw/main.m
	our_proposed_approaches/individual_approaches/letter_a_median/main.m
	our_proposed_approaches/individual_approaches/letter_a_average/main.m

You can change the line below with more GPU indeces. For example,

	opts.train.gpus = [1] ;

can become

	opts.train.gpus = [1 2 3];

You can also use no GPUs if you dont have them.
	
	opts.train.gpus = [] ;

If you use this code in your research don't forget to cite our work:

@ARTICLE{7517389, author={A. Ferreira and L. Bondi and L.Baroffio and P. Bestagini and J. Huang and S. Tubaro and J. A. dos Santos and A. Rocha}, journal={IEEE Transactions on Information Forensics and Security}, title={Data Driven Approaches for Laser Printer Attribution}, year={2017}, volume={}, number={}, pages={}, month={To appear in July of 2017}}

Any question, problems or suggestions with the code can be reported to Anselmo. E-mails for issues related to the source code can be sent to anselmo@szu.edu.cn or anselmo.ferreira@gmail.com

We don't give any support on MatconvNet, right?

You can find more information about Anselmo's research in his personal website: www.ic.unicamp.br/~anselmoferreira

Best Regards and have fun.
