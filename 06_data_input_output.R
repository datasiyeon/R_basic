### R에서의  입력과 출력
# 데이터 입력
age <- c(28, 17, 35, 46, 23, 67, 30, 50)
age

# 정보 추출
young <- min(age)
old <- max(age)

# 처리 결과 출력
cat('가장 젊은 사람의 나이는', young, '이고,',
    '가장 나이든 사람의 나이는', old, '입니다. \n')

### 화면에서 데이터 입력받기
install.packages('svDialogs') # 패키지 설치
library(svDialogs)
user.input <- dlgInput('Input income')$res
user.input
income <- as.numeric(user.input) # 문자열을 숫자로
income
tax <- income*0.05
cat('세금: ', tax) # 세금 계산

### print() 함수와 cat() 함수
result <- sqrt(200)
result # result의 내용 출력

x <- 26
y <- '입니다'
z <- c(10,20,30,40)
print(x)                # 하나의 값 출력
print(y)                # 하나의 값 출력
print(z)                # 벡터 출력
print(iris[1:5,])       # 데이터프레임 출력
print(x,y)              # 두 개의 값 출력(에러 발생)

x <- 26
y <- '입니다'
z <- c(10,20,30,40)
cat(x, '\n')            # 하나의 값 출력
cat(y, '\n')            # 하나의 값 출력
cat(z, '\n')            # 벡터 출력
cat(x,y, '\n')          # 두 값을 연결하여 출력
cat(iris[1:5], '\n')    # 데이터프레임 출력(에러 발생)

### 체질량 지수 계산하기
library(svDialogs)

height <- dlgInput('Input height(cm)')$res
weight <- dlgInput('Input weight(kg)')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height <- height / 100
bmi <- weight / (height^2)

cat('입력한 키는 ', height*100, 'cm, 몸무게는 ', weight, 'kg 입니다. \n',sep = "")
cat('BMI는 ', bmi, '입니다.', sep = "")

### 작업 폴더
getwd()             # 현재 작업 폴더 알아내기
setwd('C:/Rworks')  # 작업 폴더 변경하기
getwd()

### csv 파일 읽기와 쓰기
setwd('C:/Rworks')                           # 작업 폴더 지정
air <- read.csv('airquality.csv', header = T)# .csv 파일 읽기
head(air)
class(air)                             # air의 자료구조 확인

### csv 파일에 데이터 쓰기
setwd('C:Rworks')                   # 작업 폴더 지정
# setosa 품종 데이터만 추출
my.iris <- subset(iris, Species=='setosa')
# .csv 파일에 저장하기
write.csv(my.iris, 'my_iris.csv', row.names = F)

### 엑셀 파일 읽기와 쓰기
install.packages('xlsx')              # 패키지 설치하기
library(xlsx)                         # 패키지 불러오기
air <- read.xlsx('C:/Rworks/airquality.xlsx', header=T,
                 sheetIndex=1)        # .xlsx 파일 읽기
head(air)


library(xlsx)                                      # 패키지 불러오기
my.iris <- subset(iris, Species=='setosa')         # setosa 품종 데이터만 추출
write.xlsx(my.iris, 'my_iris.xlsx', row.names = F) # 파일에 저장하기

### 다이아몬드 정보 제공하기
setwd('C:Rworks/Shiny')                                         # 1. 파일을 저장하기 위해 작업 폴더를 'C:/Rworks/Shiny'로 합니다.
library(ggplot2)                                                # 2. diamonds 데이터셋을 불러오기 위해 ggplot2 패키지를 로딩합니다.
str(diamonds)                                                   # 데이터셋의 구조를 살펴본 뒤, 커팅 품질(cut)과 무게(carat)에 해당하는 열 이름을 확인합니다.
diamonds.new <- subset(diamonds, cut == 'Premium' & carat >= 2) # 3. 커팅 품질이 Premium이며 무게가 2캐럿 이상인 다이아몬드 데이터를 추출하여 변수 diamonds.new에 저장합니다.
write.csv(diamonds.new, 'shiny_diamonds.csv', row.names = F)    # 4. 추출한 데이터를 shiny_diamonds.csv 파일로 저장합니다.
diamonds.load <- read.csv('shiny_diamonds.csv', header = T)     # 5. 전날 전달했던 csv 파일을 불러와 변수 diamonds.load에 저장합니다.
diamonds.new <- subset(diamonds.load, color != 'D')             # 6. 색에 해당하는 열을 확인한 다음 열 값이 D인 경우를 제외하여 변수 diamonds.new에 저장합니다.
library(xlsx)                                                   # 7. xlsx 패키지를 불러온 뒤 
write.xlsx(diamonds.new, 'shiny_diamonds.xlsx', row.names = F)  # 추출한 데이터를 shiny_diamonds.xlsx로 저장합니다.
