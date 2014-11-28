classification-of-handwritten-numerals
======================================
Overview

This project is to implement and evaluate classification algorithms. You will implement two
different methods of classification and compare their performance with a publicly available
package.

Classification of Handwritten Numerals

This project is about multi-class classification. The task is handwritten digit recognition where
there are ten digits (0-9). Examples of each of the digits are given below.
Figure 1: Examples of each of the digits
You are provided with two types of input data, feature vectors and raw images (the data is
on UBLearns.):
1. GSC features extracted from each of the image: each image is represented by a 512-bit
vector, the first 192 are G (gradient), the next 192 are S (structural) and the last 128 are
C (concavity). 1
2. Handwritten digit images: in case you want to experiment with other feature extractors,
you are given handwritten images (image type .png). These are segmented images scanned
at a resolution of 100ppi and cropped.
1 The GSC feature extractor was developed at CEDAR/UB. If you are interested in the details see: http:
//www.cedar.buffalo.edu/~srihari/papers/JFS2008-color.pdf

1. Data set:

Training Data
Both the feature vectors and images can be found at UB learns. Each digit has 2000
samples available for training. Figure 2 shows variant ’0’s in the data set.
Figure 2: Examples of digit ’0’s

Testing Data
The feature vectors and images correspond to 1500 digit images (150 for each digit). You
are expected to predict the labels for the test set and submit a vector of labels.

2. Classifiers:

You are to implement two different classifiers on your own and also choose a publicly
available classifier (one among those listed in Appendix A). The three classifiers are to
be evaluated and compared the performance using two different evaluation metrics (see
Appendix B). The two classifiers to implement are:
(a) Logistic Regression (LR)
(b) Neural Network (NN)

You are encouraged to implement other classifiers, such as Naive Bayes, Bayesian logistic
regression, etc, and find better existing classification packages with comparable perfor-
mance. You will get extra bonus points in this project for your extra work.

3. Training and Testing:

Training
Name your training program "train lr.m", "train nn.m" "train blr.m" and so on.
The input of the training programs is an X = N × (D + 1) matrix, where N is the number
of the training samples and D + 1 is the length of each training sample vector consisting
of D features and the corresponding classification label. To select the appropriate model
parameters for testing, you may want to further decompose the training set into training
and validation set and tune your parameters using the validation set. Or you can use
cross validation on the training set to select your model.

Testing
Once you are satisfied with your model on your training set, for each of the test feature
vector provided, the class needs to be predicted using the model you learned. Name
your testing program "test lr.m", "test nn.m", "test blr.m" and so on. Your testing
programs should take a Y = N ′ × D matrix as input and output a T = N ′ × 1 vector of
classification labels. In testing phase N ′ is the size of the testing data set.

4. Optional:

Extract Features from Data: The accuracy of hand written digital recognition is
determined by both the feature extraction and classification methods. Before you use
the classification method to train the data, you should process the original images into a
matrix containing category labels (the first column) and feature vectors. Since you are
already provided with the extracted features, you can start with the provided feature vec-
tors, but you are encouraged to develop your own features and compare the performance
of your features with the provided GSC features. This input matrix will be fed into your
classification model.
