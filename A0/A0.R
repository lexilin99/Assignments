

# Assignment 0 


#### Exercise 1 Introduction


# 1. Create a directory for this class and store your script “a0.R”
# 2. Install the packages, Hmisc, gdata,boot,xtable,MASS,moments,snow,mvtnorm
list_packages = c("Hmisc","gdata","boot","MASS","moments","snow","mvtnorm")
install.packages(list_packages)
# 3. Set your working directory
setwd("/Users/xinlin/Desktop/ECON 613 MicroEconometrics/homework/A0")
# 4. List the content of your directory and the content of your environment 
dir()
ls()
# 5. Check whether 678 is a multiple of 9
678 %% 9 == 0
# 6. Save your environment
save.image()
# 7. Find help on the function mean, cut2
?mean()
?cut2()
??cut2()
# 8. Find an operation that returns NaN (Not A Number)
log(-1)


#### Exercise 2 Object Manipulation


# 1. Print Titanic, and write the code to answer these questions (one function (sum) , one operation)
print(Titanic)
dimnames(Titanic)
# 1. (a) Total population 
sum(Titanic)
# 1. (b) Total adults
sum(Titanic[,,"Adult",])
# 1. (c) Total crew
sum(Titanic["Crew",,,])
# 1. (d) 3rd class children
sum(Titanic["3rd",,"Child",])
# 1. (e) 2nd class adult female 
sum(Titanic["2nd","Female","Adult",])
# 1. (f) 1st class children male 
sum(Titanic["1st","Male","Child",])
# 1. (g) Female Crew survivor
sum(Titanic["Crew","Female",,"Yes"])
# 1. (h) 1st class adult male survivor 
sum(Titanic["1st","Male","Adult","Yes"])
# 2. Using the function prop.table, find
# 2. (a) The proportion of survivors among first class, male, adult 
prop.table(Titanic["1st","Male","Adult",])
# 2. (b) The proportion of survivors among first class, female, adult
prop.table(Titanic["1st","Female","Adult",])
# 2. (c) The proportion of survivors among first class, male, children 
prop.table(Titanic["1st","Male","Child",])
# 2. (d) The proportion of survivors among third class, female, adult
prop.table(Titanic["3rd","Female","Adult",])


#### Exercise 3 Vectors - Introduction


# 1. Use three different ways, to create the vectors
# 1. (a) a = 1,2,...,50
1:50
seq(1, 50, by = 1)
rev(50:1)
# 1. (b) b = 50,49,...,1
50:1
seq(50, 1, by = -1)
rev(1:50)
# 2. Create the vectors
# 2. (a) a = 10,19,7,10,19,7,...,10,19,7 with 15 occurrences of 10,19,7
rep(c(10, 19, 7), 15)
# 2. (b) b = 1,2,5,6,...,1,2,5,6 with 8 occurrences of 1,2,5,6
rep(c(1, 2, 5, 6), 8)
# 3. Create a vector of the values of log(x)sin(x) at x = 3.1, 3.2, . . . , 6
x = seq(3.1, 6, by = 0.1)
log(x)*sin(x)
# 4. Using the function sample, draw 90 values between (0,100) and calculate the mean. 
#    Re-do the same operation allowing for replacement
mean(sample(c(0:100), 90, replace = FALSE))
mean(sample(c(0:100), 90, replace = TRUE))
# 5. Calculate
a = 1:20
b = t(c(1:15))
sum(exp(sqrt(a))*log(a^5)/(5+cos(a)%*%sin(b)))
curr = 0
for (i in a) {
  b = t(c(1:i))
  curr = curr + sum(exp(sqrt(a))*log(a^5)/(5+exp(a%*%b)*cos(a)%*%sin(b)))
}
# 6. Create a vector of the values of exp(x) cos(x) at x = 3, 3.1, ...6
x = seq(3, 6, by = 0.1)
exp(x)*cos(x)


#### Exercise 4 Vectors - Advanced


# 1. Create two vectors xV ec and yV ec by sampling 1000 values between 0 and 999
xVec = sample(0:999, 1000, replace = T)
yVec = sample(0:999, 1000, replace = T)
# 2, 
# 2. (a) Create the vector (y2 − x1,...,yn − xn−1) denoted by zVec
zVec = yVec[-1]-xVec[-length(xVec)]
# 2. (b) Create the vector (sin(y1)/cos(x2),sin(y2)/cos(x3),...,sin(yn−1)/cos(xn)) denoted by wVec
wVec = yVec[1:length(yVec)-1]/xVec[2:length(xVec)]
# 2. (c) Create a vector subX which consists of the values of xV ec which are ≥ 200
subX = xVec[xVec >= 200]
# 2. (d) What are the index positions in yV ec of the values which are ≥ 600
which(yVec >= 600)


#### Exercise 5 Matrix


# 1. Create the matrix A = first row: 1 1 3 second row: 5 2 6 third row: -2 -1 -3
A = matrix(c(1, 1, 3, 5, 2, 6, -2, -1, -3), 3, 3, byrow = T)
A
# 1. (a) Check that A^3=0 (matrix 0)
A^3 == 0
# 1. (b) Bind a fourth column as the sum of the first and third column 
cbind(A,A[,1]+A[,3])
# 1. (c) Replace the third row by the sum of the first and second row
A[3,] = A[1,] + A[2,]
# 1. (d) Calculate the average by row and column
rowMeans(A)
colMeans(A)
# 2. Solve the system of equations:
#         2x + y + 3z = 10
#         x + y + z = 6
#         x + 3y + 2z = 13
mat = matrix(c(2,1,3,10,1,1,1,6,1,3,2,13), nrow = 3, ncol = 4, byrow = T)
solve(mat[1:3, 1:3], mat[,4])


#### Exercise 6 Functions



#### Exercise 7 Indexes



#### Exercise 8 Data Manipulation


# 1. Load the library AER, and the dataset (data("GSOEP9402”)) to be named dat
library(AER)
dat <- GSOEP9402
# 2. What type of object is it? Find the number of rows and column? Can you provide the names of the variables?
typeof(dat)
class(dat)
nrow(dat)
ncol(dat)
names(dat)
# 3. Evaluate and plot the average annual income by year
library(dplyr)
library(ggplot2)
# 4. Create an array that illustrates simultaneously the income differences (mean) by gender, school and memployment



#### Exercise 9 First Regression



#### Exercise 10 Advanced Indexing



#### Exercise 11 Tests and Indexing



#### Exercise 12 Programming


# 1. Evaluate 1^2 +2^2 +3^2 +...400^2
x = 1:400
sum(x^2)

#### Exercise 13 Apply Functions



#### Exercise 14 Simulating and Computing



#### Exercise 15 Moments


V = rnorm(100, -2, 5)
# 1. Evaluate n as the length of V
n = length(V) 
n
# 2. mean
mean(V)
# 3. variance
var(V)
# 4. skewness
library(moments)
skewness(V)
# 5. kurtosis
kurtosis(V)


#### Exercise 16 OLS


# 1. Create a matrix X of dimension (1000,10). 
#    Fill it with draws from a beta distribution with shape1 parameter 2, and shape 2 parameter 1. 
#    Make sure that there is no negative.

# 2. Create a scalar denoted by σ2 and set it to 0.5. 
#    Generate a vector β of size 10. Fill it with draws from a Gamma distribution with parameters 2 and 1.

# 3. Create a vector ε of 1000 draws from a normal distribution

# 4.Create Y=Xβ+ σ2∗ε

# 5. Recover βˆ = (X′X)−1(X′Y )

# 6. Evaluate 􏰃ε = y􏰃 − y.
#    Plot the histogram (filled in grey) and the kernel density of the distribution of the error term.

# 8. Create param that binds (β, V (β)). Using the command lm, check these estimates

# 9. Construct a confidence interval for β

# 10. Redo the exercise by setting σ2 = 0.01. How are your confidence intervals for β









