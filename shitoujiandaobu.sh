c=1
while [ $c == 1 ]
do
  begin_time=$((`date +%s`)) 

  X=(石头 剪刀 布)  ##0石头 1剪刀 2布
  read -p "请用户出拳(0为石头,1为剪刀,2为布)：" a
  d=0
  while [ $d == 0 ]
  do
    if [ $a == 0 ] || [ $a == 1 ] || [ $a == 2 ];then
      echo "用户出拳为： ${X[$a]} "
      d=1
    else
      read -p "请输入0，1，2中的一个数(0为石头,1为剪刀,2为布)：" a
    fi
  done

  x=$[RANDOM%3]   ##随机数0 1 2
  b=${X[$x]}      ##电脑随机出
  echo "电脑出拳为： $b"

  case $x in
  0)              ##电脑石头
    if [ $a == 0 ];then    ##用户石头
      echo "平局！"
    elif [ $a == 1 ];then  ##用户剪刀
      echo  "电脑胜！"
    else                   ##用户布
      echo "玩家胜"
    fi;;
  1)              ##电脑剪刀
    if [ $a == 0 ];then     ##用户石头
      echo "玩家胜！"
    elif [ $a == 1 ];then  ##用户剪刀
      echo  "平局！"
    else                   ##用户布
      echo "电脑胜"
    fi;;
  2)              ##电脑布
    if [ $a == 0 ];then     ##用户石头
      echo "电脑胜！"
    elif [ $a == 1 ];then  ##用户剪刀
      echo  "玩家胜！"
    else                   ##用户布
      echo "平局"
    fi;;
    ##exit x
  esac

  end_time=$((`date +%s`))
  cost_time=$((end_time-begin_time))
  echo "本次猜拳共花费 $cost_time 秒"
  
  read -p "是否继续游戏(0为退出，1为继续)：" c
done
