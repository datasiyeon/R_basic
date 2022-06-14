### 08_기본 그래프 작성하기1
## 막대그래프 작성하기
# 코드 8-1
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING') # 데이터 입력
favorite                            # favorite의 내용 출력
table(favorite)                     # 도수분포 계산    
# 코드 8-2 (이어서) 
ds <- table(favorite)               # 도수분포표 저장
ds                                  # 도수분포표 내용 확인
barplot(ds, main='favorite season') # 막대그래프 작성
## 막대그래프 색 지정하기
# 코드 8-3 (이어서)
barplot(ds, main='favorite season',
        col='blue')                 # 막대의 색 지정
## 막대별로 색을 다르게 지정하기
# 코드 8-4 (이어서)
barplot(ds, main='favorite season',
        col=c('blue', 'red', 'green', 'yellow')) # 막대의 색을 각각 지정
## x축, y축에 설명 붙이기
# 코드 8-5 (이어서)
barplot(ds, main='favorite season',
        col='green',                # 막대의 색 지정
        xlab='계절',                # x축 설명
        ylab='빈도수')              # y축 설명
## 그래프 막대를 수평 방향으로 출력하기
# 코드 8-6 (이어서)
barplot(ds, main='favorite season',
        col='yellow',               # 막대의 색 지정
        horiz=TRUE)                 # 수평 방향 출력 
## x축의 그룹 이름 바꾸기
# 코드 8-7 (이어서)
barplot(ds, main='favorite season',
        col='yellow',                 # 막대의 색 지정
        names=c('FA','SP','SU','WI')) # 그룹 이름을 바꾸어 출력
## x축의 그룹 이름을 수직 방향으로 출력하기
# 코드 8-8 (이어서)
barplot(ds, main='favorite season',
        col='green',          # 막대의 색 지정
        las=2)                # 그룹 이름을 수직 방향으로
## 중첩 그룹의 막대그래프
# 코드 8-9
# 데이터 입력
age.A <- c(13709, 10974, 7979, 5000, 4250)
age.B <- c(17540, 29701, 36209, 33947, 24487)
age.C <- c(991, 2195, 5366, 12980, 19007)
ds <- rbind(age.A, age.B, age.C)
colnames(ds) <- c('1970','1990','2010','2030','2050')
ds
# 그래프 작성
barplot(ds, main='인구 추정')
## 연령대별로 색을 다르게 지정하기
# 코드 8-10 (이어서)
barplot(ds, main='인구 추정',
        col=c('green','blue','yellow'))
## 연령대를 각각의 막대로 표현하기
# 코드 8-11 (이어서)
barplot(ds, main='인구 추정',
        col=c('green', 'blue', 'yellow'),
        beside=TRUE)
## 막대그래프에 범례 추가
# 코드 8-12 (이어서)
barplot(ds, main='인구 추정',
        col=c('green', 'blue', 'yellow'),
        beside=TRUE,
        legend.text=T)
## 범례를 그래프 밖에 표시하기
# 코드 8-13 (이어서)
par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))
   # mfrow=c(1,1) 창을 분할하지않음 의미
   # mar=c(5, 5, 5, 7) : 그래프 출력창과 그래프 출력 영역밖의 여유공간을 지정
   # c(bottom, left, top, right) 순서로 숫자를 지정.
barplot(ds, main='인구 추정',
        col=c('green', 'blue', 'yellow'),
        beside=TRUE,
        legend.text=T,
        args.legend = list(x='topright', bty='n',
                           inset=c(-0.25,0)))
   # x='topright':범례를 출력할 기본 위치를 지정하는데
   #  'topright'은그래프 출력 영역의 위쪽에서 오른쪽을 의미
   # bty='o':범례가 표시되는 영역에 테두리선을 표시할지의 여부를 지정
   #  'o'은 테두리선을 표시하고,'n'은 테두리선을 표시하지 않음.
   # inset=c(-0.25,0):범례를 x축과 y축방향으로 얼마나 이동시킬지를 지정
   #  -1~1 사이의 값을 지정(%를 의미)

## 범례의 내용 바꾸기
# 코드 8-14 (이어서)
par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))   # 그래프 윈도우 설정
barplot(ds, main='인구 추정',
        col=c('green', 'blue', 'yellow'),
        beside=TRUE,
        legend.text=c('0~14세', '15~64세', '65세 이상'),
        args.legend = list(x='topright', bty='n',
                           inset=c(-0.25,0)))
par(mfrow=c(1,1), mar=c(5,4,4,2)+0.1)   # 그래프창 설정 해제

### 사업부문별 매출액 그래프 그리기
# 1. 우선 사업부문별 매출액 데이터셋을 구성합니다.
ha <- c(54659, 61028, 53307, 46161, 54180)
he <- c(31215, 29863, 32098, 39684, 29707)
mc <- c(15104, 16133, 15222, 13208, 9986)
vs <- c(13470, 14231, 13401, 13552, 13193)
bs <- c(16513, 14947, 15112, 14392, 17091)

ds <- rbind(ha, he, mc, vs, bs)
colnames(ds) <- c('19.1Q', '19.2Q', '19.3Q', '19.4Q', '20.1Q')

barplot(ds, main = '사업부문별 매출액')

barplot(ds, main = '사업부문별 매출액',
        col = c('#003f5c', '#58508d', '#bc5090', '#ff6361', '#ffa600'))

barplot(ds, main = '사업부문별 매출액',
        col = c('#003f5c', '#58508d', '#bc5090', '#ff6361',
                '#ffa600'),
        horiz = T, las = 1)

barplot(ds, main = '사업부문별 매출액',
        col = c('#003f5c', '#58508d', '#bc5090', '#ff6361',
                '#ffa600'),
        horiz = T, las = 1,
        xlab = '억 원', beside = T)

par(mfrow = c(1,1), mar = c(5, 5, 5, 10))
barplot(ds, main = '사업부문별 매출액',
        col = c('#003f5c', '#58508d', '#bc5090', '#ff6361',
                '#ffa600'),
        horiz = T, las = 1,
        xlab = '억 원', beside = T,
        legend.text = c('H&A', 'HE', 'MC', 'VS', 'BS'),
        args.legned = list(x='topright', bty='n', inset=c(-0.25,0)))
par(mfrow = c(1,1), mar = c(5, 4, 4, 2)+.1)

## 히스토그램
# 코드 8-15
head(cars)
dist <- cars[,2]                    # 자동차 제동거리
dist
hist(dist,                          # data
     main='Histogram for 제동거리',         # 제목
     xlab ='제동거리',              # x축 레이블
     ylab ='빈도수',                # y축 레이블
     border='blue',                 # 막대 테두리색
     col='green',                   # 막대 색
     las=2,                         # x축 글씨 방향(0~3)
     breaks=5)                      # 막대 개수 조절
# 코드 8-16 (이어서)
result <- hist(dist, # data
               main='Histogram for 제동거리',
               breaks=5)
result
freq <- result$counts
names(freq) <- result$breaks[-1]
freq

### 다이아몬드 시세 파악하기
# 1. Stat2Data 패키지 안에 있는 Diamonds 데이터셋을 불러와 PricePerCt(캐럿당 가격) 열에 있는 정보를 사용합니다.
library(Stat2Data)
data(Diamonds)
ds <- Diamonds$PricePerCt       # 캐럿당 가격
# 2. ds 데이터를 활용해 히스토그램을 그립니다.
hist(ds, main = '캐럿당 가격 분포',
     breaks = 9)
# 3. x축 설명에는 '캐럿당 가격($)', y축 설명에는 '빈도수'를 추갛고 y축의 값은 수평으로 보이도록 설정합니다.
hist(ds, main = '캐럿당 가격 분포', 
     breaks = 9,
     xlab = '캐럿당 가격($)', ylab = '빈도수', las = 1)
# 4. 가장 빈도가 높은 3번째 구간을 다른 색으로 강조합니다.
color <- rep('#a8dadc', 9)
color[3] <- '#1d3557'

hist(ds, main = '1캐럿당 가격 분포',
     breaks = 9,
     xlab = '캐럿당 가격($)', ylab = '빈도수', las = 1,
     col = color,
     border = '#457b9d')

## 다중 그래프
# 코드 8-17
par(mfrow=c(2,2), mar=c(3,3,4,2))   # 화면 분할(2x2)

hist(iris$Sepal.Length,             # 그래프 1
     main='Sepal.Length',
     col='orange')

barplot(table(mtcars$cyl),          # 그래프 2
        main='mtcars',
        col=c('red','green','blue'))

barplot(table(mtcars$gear),         # 그래프 3
        main='mtcars',
        col=rainbow(3),             # 레인보우 팔레트 사용
        horiz = TRUE)

pie(table(mtcars$cyl),              # 그래프 4
    main='mtcars',
    col=topo.colors(3),             # topo 팔레트 사용
    radius = 2)

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1) # 화면 분할 취소

### 정책 지지도 그래프 그리기
# 1. carData 패키지 안에 있는 Chile 데이터셋을 불러와 변수 ds에 저장합니다.
install.packages('carData')
library(carData)
ds <- Chile
colors <- rainbow(20)   # 레인보우 팔레트에서 20색 선택
# 2. 화면을 2행 3열의 레이아웃으로 분할합니다.
par(mfrow = c(2,3))
# 3. 첫 번째 행에 지역별, 성별, 교육수준별 분포에 대한 3개의 막대그래프를 작성합니다.
barplot(table(ds$region), main = '지역별 분포', col=colors[1:5])
barplot(table(ds$sex), main = '성별 분포', col=colors[6:7])
barplot(table(ds$education), main = '교육수준별 분포',
        col=colors[8:10])
# 4. 두 번째 행에 연령, 수입, 정책 지지도에 대한 3개의 히스토그램을 작성합니다.
hist(ds$age, breaks = 6, main = '연령', xlab = 'age', col=colors[1:6])
hist(ds$income, breaks = 4, main = '수입', xlab = 'income',
     col=colors[11:14])
hist(ds$statusquo, breaks = 9, main = '정책 지지도', xlab = 'support',
     col=colors[15:20])
# 5. 추후 있을 작업을 위해 설정했던 화면의 레이아웃을 초기 상태로 되돌립니다.
par(mfrow = c(1,1))
# 6. 작성한 그래프를 이미지로 저장해 기자에게 전달합니다.

### 종업원의 팁 정보 그래프 작성하기
# 1. reshape2 패키지 안에 들어있는 tips 데이터셋을 불러와 구조를 살펴봅니다.
install.packages('reshape2')
library(reshape2)
str(tips)
# 2. 성별(sex), 요일(day), 식사 시간대(time), 일행의 규모(size)에 따라 받은 팁의 빈도를 그래프로 작성
par(mfrow = c(2,2))
barplot(table(tips$sex), main = 'gender')
barplot(table(tips$day), main = 'Day of the week')
barplot(table(tips$time), main = 'time')
barplot(table(tips$size), main = 'size')
par(mfrow= c(1,1))
# 3. 각 그래프마다 빈도가 많은 막대에 색을 넣어 강조하여 표현합니다.
color.6 <-rep('#a8dadc', 6)
color.6[2] <-'#1d3557'
color.4 <-rep('#a8dadc', 4)

color.4[2] <-'#1d3557'
color.4[3] <-'#457b9d'
par(mfrow= c(2,2))

barplot(table(tips$sex), main='gender', col=c('#a8dadc', '#1d3557'))
barplot(table(tips$day), main='Day of the week', col=color.4)
barplot(table(tips$time), main='time', col=c('#1d3557', '#a8dadc'))
barplot(table(tips$size), main='size', col=color.6)
par(mfrow= c(1,1))
# 4. 1인당 주문 금액과 팁을 주는 것과 관련이 있는지 살펴보기 위해
# perHead라는 새로운 열을 만들어 주문 금액을 일행의 수로 나눈 결과를 저장합니다.
tips.new <- tips
tips.new$perHead <- tips.new$total_bill / tips.new$size
# 5. 1인당 주문 금액을 다시 전체, 런치, 디너 타임별로 비교할 수 있도록
# 데이터를 추출하여 그래프를 작성하고, 한 화면에 출력해 차이가 나는지 비교해봅니다.
par(mfrow = c(1,3))
hist(tips.new$perHead, main = '1인당 주문 금액', breaks = 5,
     xlab = '단위:달러')
hist(tips.new[tips.new$time == 'Lunch', 'perHead'],
     main = '1인당 주문 금액(런치)', breaks =4, xlab = '단위:달러')
hist(tips.new[tips.new$time == 'Dinner', 'perHead'],
     main = '1인당 주문 금액(디너)', breaks =4, xlab = '단위:달러')
par(mfrow = c(1,1))
# 6. 앞에서 작업한 것과 같이 빈도가 많은 막대에 강조하는 색을 넣어 다시 출력합니다.
color.5 <-rep('#a8dadc', 6)
color.5[2] <-'#1d3557'

par(mfrow = c(1,3))
hist(tips.new$perHead,
     main = '1인당 주문 금액', xlab = '단위:달러', 
     breaks = 5, col = color.5)
hist(tips.new[tips.new$time == 'Lunch', 'perHead'],
     main = '1인당 주문 금액(런치)', xlab = '단위:달러', 
     breaks =4, col= color.5)
hist(tips.new[tips.new$time == 'Dinner', 'perHead'],
     main = '1인당 주문 금액(디너)', xlab = '단위:달러', 
     breaks =4, col = color.5)
par(mfrow = c(1,1))
# 7. 이번에는 주문 금액 대비 받은 팁의 비율이 차이가 나는지 살펴봅니다.
tips.new$percent <- tips.new$tip / tips.new$total_bill * 100
par(mfrow = c(1,2))
res.lunch <- hist(tips.new[tips.new$time == 'Lunch', 'percent'],
                  main = '주문 금액 대비 팁의 비율(런치)',
                  xlab = 'percent(%)',
                  breaks = 5)
res.dinner <- hist(tips.new[tips.new$time == 'Dinner', 'percent'],
                   main = '주문. 금액 대비 팁의 비율(디너)',
                   xlab = 'percent(%)',
                   breaks = 10)
par(mfrow = c(1,1))
# 8. 지금부터는 앞서 저장한 두 개의 hist 객체에서 5~30 구간의 빈도값만 추출하고 병합할 것입니다.
res.lunch
res.dinner
res <-rbind(lunch = c(0, res.lunch$counts),
            dinner = res.dinner$counts[1:6])
colnames(res) <-res.dinner$breaks[2:7]
# 9. res 데이터셋을 이용하면 제한된 범위 내에서 각각의 빈도를 한 그래프에서 확인할 수 있습니다.
barplot(res, main = '식사 시간에 따른 팁 비율 분포',
        col = c('#1d3557', '#a8dadc'),
        legend.text= c('Lunch', 'Dinner'))