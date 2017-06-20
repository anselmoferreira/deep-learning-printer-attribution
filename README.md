# deep-learning-printer-attribution
Source code related to the paper "Data-Driven Feature Characterization Techniques for Laser Printer Attribution", published by IEEE Transactions on Information Forensics and Security.

Authors: Anselmo Ferreira, Luca Bondi and  Paolo Bestagini

INSTRUCTIONS

The source code is divided in two parts:

our_proposed_approach: here you can simulate the 5x2 cross validation results in the paper using our multiple representation of multiple data networks. Results can vary a little bit as here the code was updated to run in matconvnet version 23.

other_networks: Here you can do the experiments again but using individual deeper neural networks such as the IMAGENET and GOOGLELENET. The code here is using the caffe library for Matlab.

You must have the libraries MatconvNet to run our_proposed_approach and Caffe to run other_networks. Please check files readme.md inside each folder to know how to configure your code to run using these libraries. We don't give support on MatConvNet and caffe libraries, ok? look for forums related to these libraries to solve installation problems.

If you use this code in your research don't forget to cite our work:

@ARTICLE{7517389, author={A. Ferreira and L. Bondi and L.Baroffio and P. Bestagini and J. Huang and S. Tubaro and J. A. dos Santos and A. Rocha}, journal={IEEE Transactions on Information Forensics and Security}, title={Data Driven Approaches for Laser Printer Attribution}, year={2017}, volume={}, number={}, pages={}, month={To appear in July of 2017}}

Any question, problems or suggestions with the code can be reported to Anselmo. E-mails for issues related to the source code can be sent to anselmo@szu.edu.cn or anselmo.ferreira@gmail.com

You can find more information about Anselmo's research in his personal website: www.ic.unicamp.br/~anselmoferreira

Best Regards and have fun.

