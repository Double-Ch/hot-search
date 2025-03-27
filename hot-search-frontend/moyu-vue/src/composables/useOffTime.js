import { ref, onMounted } from 'vue';

export function useHotList() {
  const offTime = ref(new Date());

  // 设置下班时间
  const setOffTime = () => {
    const timeInput = document.getElementById('offTime').value;
    const [hoursInput, minutesInput] = timeInput.split(':').map(Number);
    const now = new Date();
    offTime.value = new Date(now);
    offTime.value.setHours(hoursInput, minutesInput, 0, 0);
    if (offTime.value <= now) {
      offTime.value.setDate(offTime.value.getDate() + 1);
    }
    // 保存到本地存储
    localStorage.setItem('offTime', offTime.value.toISOString());
    // 更新输入框的值
    document.getElementById('offTime').value = timeInput;
    updateCountdown();
  };

  // 更新倒计时
  const updateCountdown = () => {
    const now = new Date();
    const workEndTime = offTime.value;
    if (now > workEndTime) {
      offTime.value.setDate(offTime.value.getDate() + 1);
    }
    const timeDifference = workEndTime - now;

    hours.value = Math.floor(timeDifference / (1000 * 60 * 60));
    minutes.value = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
    seconds.value = Math.floor((timeDifference % (1000 * 60)) / 1000);

    document.getElementById('hours').textContent = hours.value.toString().padStart(2, '0');
    document.getElementById('minutes').textContent = minutes.value.toString().padStart(2, '0');
    document.getElementById('seconds').textContent = seconds.value.toString().padStart(2, '0');
  };

  onMounted(() => {
    // 从本地存储加载下班时间
    const savedOffTime = localStorage.getItem('offTime');
    if (savedOffTime) {
      offTime.value = new Date(savedOffTime);
      // 更新输入框的值
      const hours = offTime.value.getHours();
      const minutes = offTime.value.getMinutes();
      document.getElementById('offTime').value = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
    } else {
      // 默认下班时间为18:00
      const now = new Date();
      offTime.value = new Date(now);
      offTime.value.setHours(18, 0, 0, 0);
      if (offTime.value <= now) {
        offTime.value.setDate(offTime.value.getDate() + 1);
      }
      // 更新输入框的值
      document.getElementById('offTime').value = '18:00';
    }

    updateCountdown();
    setInterval(updateCountdown, 1000);
  });

  return {
    setOffTime
  };
}