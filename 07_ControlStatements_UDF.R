#### 07_제어문과 사용자 정의 함수 사용하기 ####
### if-else문
# 코드 7-1
job.type <- 'A'
if (job.type == 'B') {
  bonus <- 200           # 직군이 B일 때 실행
} else {
  bonus <- 100           # 직군이 B가 아닌 나머지 경우 실행
}
print(bonus)
# 코드 7-2
job.type <- 'A'
bonus <- 100
if (job.type == 'B') {
  bonus <- 200           # 직군이 B일 때 실행
}
print(bonus)
# -------------------
a <- 10
if (a<5) {
  print(a)
} else {
  print(a*10)
  print(a/10)
}
# -------------------
a <- 10
b <- 20
if (a>5 & b>5) {            # and
  print(a+b)
}
if (a>5 | b>30) {           # or
  print(a*b)
}
# 코드 7-3
# if-else를 이용한 처리 
a <- 10
b <- 20

if (a>b) {
  c <- a
} else {
  c <- b
}
print(c)

# ifelse를 이용한 처리
a <- 10
b <- 20

c <- ifelse(a>b, a, b)
print(c)
# if-else의 반복
# 코드 7-4
score <- 85

if (score > 90) {
  grade <- 'A'
} else if (score > 80) {
  grade <- 'B'
} else if (score > 70) {
  grade <- 'C'
} else if (score > 60) {
  grade <- 'D'
} else {
  grade <- 'F'
}
print(grade)
# 회원 등급 분류하고 혜택 부여하기
install.packages("svDialogs")
library(svDialogs)
purchase <- dlgInput('Enter the purchase amount')$res
purchase <- as.numeric(purchase)

type <- NULL
ratio <- NULL

if (purchase >= 300000) {
  type <- '플래티넘'
  ratio <- 0.07
} else if (purchase >= 200000) {
  type <- '골드'
  ratio <- 0.05
} else if (purchase >= 100000) {
  type <- '실버'
  ratio <- 0.03
} else {
  type <- '프렌즈'
  ratio <- 0.01
}

cat('고객님은', type, '회원으로 구매액의', ratio*100, '%가 적립됩니다.')

###for문
# 코드 7-5
for(i in 1:5) {
  print('*')
}
# 코드 7-6
for(i in 6:10) {
  print(i)
}
# 코드 7-7
for(i in 1:9) {
  cat('2 *', i, '=', 2*i, '\n')
}
# 코드 7-8
for(i in 1:20) {
  if(i%%2==0) {                     # 짝수인지 확인
    cat(i, ' ')
  }
}
# 코드 7-9
sum <- 0
for(i in 1:100) {
  sum <- sum + i                    # sum에 i 값을 누적
}
print(sum)
# 코드 7-10
norow <- nrow(iris)                 # iris의 행의 수
mylabel <- c()                      # 비어있는 벡터 선언
for(i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {  # 꽃잎의 길이에 따라 레이블 결정
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)                      # 레이블 출력
newds <- data.frame(iris$Petal.Length, mylabel) # 꽃잎 길이와 레이블 결합
head(newds)                         # 새로운 데이터셋 내용 출력
# 코드 7-11
sum <- 0
i <- 1
while(i <= 100) {
  sum <- sum + i                    # sum에 i 값을 누적
  i <- i + 1                        # i 값을 1 증가시킴.
}
print(sum)
### apply() 계열 함수
# 코드 7-12
apply(iris[,1:4], 1, mean)          # 행 방향으로 함수 적용
apply(iris[,1:4], 2, mean)          # 열 방향으로 함수 적용

### 자격증 합격 여부 판단하기1
sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score <- data.frame(sub1, sub2, sub3)

total <- apply(score, 1, sum)
scoreset <- cbind(score, total)

result <- c()

for(i in 1:nrow(scoreset)){
  if(scoreset[i,1] < 20*0.4 | scoreset[i,2] < 20*0.4 |
     scoreset[i,3] < 60*0.4){
    result[i] <- '불합격'
  }else if(scoreset[i,4] >= 60){
    result[i] <- '합격'
  }else{
    result[i] <- '불합격'
  }
  cat(i, '번째 응시생은', result[i], '입니다.\n')
}
### 사용자 정의 함수의 개념
# 코드 7-13
mymax <- function(x,y) {
  num.max <- x
  if (y>x) {
    num.max <- y
  }
  return(num.max)
}
# 코드 7-14
mymax(10,15)
a <- mymax(20,15)
b <- mymax(31,45)
print(a+b)
# 코드 7-15
mydiv <- function(x,y=2) {
  result <- x/y
  return(result)
}

mydiv(x=10,y=3)            # 매개변수 이름과 매개변수값을 쌍으로 입력
mydiv(10,3)                # 매개변수값만 입력
mydiv(10)                  # x에 대한 값만 입력(y값이 생략됨)
# 코드 7-16
myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))
}
result <- myfunc(5,8)
s <- result$sum          # 5와 8의 합
m <- result$mul          # 5와 8의 곱
cat('5+8 =', s, '\n')
cat('5*8 =', m, '\n')
# 코드 7-17

setwd('C:/Rworks')        # myfunc.R이 저장된 폴더
source('myfunc.R')        # myfunc.R 안에 있는 함수 실행

# 함수 사용
a <- mydiv(20,4)          # 함수 호출
b <- mydiv(30,4)          # 함수 호출
a+b
mydiv(mydiv(20,2),5)      # 함수 호출

### 자격증 합격 여부 판단하기2
determine <- function(score){ }
determine <- function(score) {
  total <- apply(score, 1, sum)
  scoreset <- cbind(score, total)
  result <- c()
  
  for(i in 1:nrow(scoreset)){
    if(scoreset[i,1] < 20*0.4 | scoreset[i,2] < 20*0.4 |
       scoreset[i,3] < 60*0.4){
        result[i] <- '불합격'
    }else if(scoreset[i, 4] >= 60){
        result[i] <- '합격'
    }else{
        result[i] <- '불합격'
    }
    cat(i, '번째 응시생은', result[i], '입니다.\n')
  }
  return(result)            #  저장된 결과 반환
}
# source('myfunc.R') ## 오류뜸.
sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score <- data.frame(sub1, sub2, sub3)

result <- determine(score)
result
result <- determine(head(score, 3))
result
# cat(i, '번째 응시생은', result[i], '입니다.\n')
source('myfunc.R')
result <- determine(score)
result

### 조건에 맞는 데이터의 위치를 찾아보자.
# 코드 7-18
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score==69)    # 성적이 69인 학생은 몇 번째에 있나?
which(score>=85)    # 성적이 85 이상인 학생은 몇 번째에 있나? 
max(score)          # 최고 점수는 몇 점인가?
which.max(score)    # 최고 점수는 몇 번째에 있나?
min(score)          # 최저 점수는 몇 점인가?
which.min(score)    # 최저 점수는 몇 번째에 있나?
# 코드 7-19
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx <- which(score<=60)  # 성적이 60 이하인 값들의 인덱스
score[idx] <- 61         # 성적이 60 이하인 값들은 61점으로 성적 상향조정
score                    # 상향조정된 성적 확인
idx <- which(score>=80)  # 성적이 80 이상인 값들의 인덱스
score.high <- score[idx] # 성적이 80 이상인 값들만 추출하여 저장
score.high               # score.high의 내용 확인

score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx <- which(score>=80)
score.high <- score[idx]
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
score.high <- subset(score, score>=80)
# 코드 7-20
idx <- which(iris$Petal.Length>5.0) # 꽃잎 길이가 5.0 이상인 값들의 인덱스
idx
iris.big <- iris[idx,] # 인덱스에 해당하는 값만 추출하여 저장
iris.big
# 코드 7-21
score <- c(60,40,95,80)
names(score) <- c('John', 'Jane', 'Tom', 'David')
score                   # 성적 데이터 출력
idx <- which.max(score)
names(score)[idx]       # 성적이 제일 좋은 학생의 이름

### 언어 발달 상황 진단 프로그램 개발하기
install.packages('Stat2Data')
library(Stat2Data)
data(ChildSpeaks)
str(ChildSpeaks)

idx <- which(ChildSpeaks$Age < 9)
ChildSpeaks[idx, 'm1'] <- 5
idx <- which(ChildSpeaks$Age >= 9 & ChildSpeaks$Age < 15)
ChildSpeaks[idx, 'm1'] <- 4
idx <- which(ChildSpeaks$Age >= 15 & ChildSpeaks$Age < 21)
ChildSpeaks[idx, 'm1'] <- 3
idx <- which(ChildSpeaks$Age >= 21 & ChildSpeaks$Age < 27)
ChildSpeaks[idx, 'm1'] <- 2
idx <- which(ChildSpeaks$Age >= 27)
ChildSpeaks[idx, 'm1'] <- 1

idx <- which(ChildSpeaks$Gesell < 70)
ChildSpeaks$m2[idx] <- 1
idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90)
ChildSpeaks$m2[idx] <- 2
idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110)
ChildSpeaks$m2[idx] <- 3
idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130)
ChildSpeaks$m2[idx] <- 4
idx <- which(ChildSpeaks$Gesell >= 130)
ChildSpeaks$m2[idx] <- 5

ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2

idx<-which(ChildSpeaks$total< 3)
ChildSpeaks$result[idx] <-'매우느림'
idx<-which(ChildSpeaks$total>= 3 & ChildSpeaks$total< 5 )
ChildSpeaks$result[idx] <-'느림'
idx<-which(ChildSpeaks$total>= 5 & ChildSpeaks$total< 7 )
ChildSpeaks$result[idx] <-'보통'
idx<-which(ChildSpeaks$total>= 7 & ChildSpeaks$total< 9 )
ChildSpeaks$result[idx] <-'빠름'
idx<-which(ChildSpeaks$total>= 9 )
ChildSpeaks$result[idx] <-'매우빠름'

ChildSpeaks
ChildSpeaks[which.min(ChildSpeaks$total),]

### 종업원의 팁 분석하기
# 1.  reshape2 패키지 안에 들어있는 tips 데이터셋을 불러와 살펴봅니다.
install.packages('reshape2')
library(reshape2)
str(tips)
# 2. 먼저 성별에 따라 팁을 주는 정도를 비교합니다.
unique(tips$sex)
idx <- which(tips[, 'sex'] == 'Female')
avg.female <- mean(tips[idx, 'tip'])
idx <- which(tips[, 'sex'] == 'Male')
avg.male <- mean(tips[idx, 'tip'])
avg.female
avg.male
# 3. 그 다음 흡연 유무에 따라 팁을 주는 정도를 비교합니다.
unique(tips$smoker)
idx <- which(tips$smoker == 'Yes')
avg.smoker <- mean(tips[idx, 'tip'])
idx <- which(tips$smoker == 'No')
avg.nonsmoker <- mean(tips[idx, 'tip'])
avg.smoker
avg.nonsmoker
# 코드 중복 줄이기
meanbycol.tip <- function(tips, colname){ }

meanbycol.tip <- function(colname) {
  value <-unique(tips[, colname])    # ①값의종류를구함
  result <-list()for(i in 1:length(value)) { # ②값의종류별로평균을구함
    idx<-which(tips[,colname] == value[i]) # ②-1
    result[i] <-mean(tips[idx,'tip']) # ②-2
  }
names(result) <-value # ③결과값에이름을붙임
return(result) # ④list 결과값반환