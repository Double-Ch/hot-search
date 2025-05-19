<template>
  <!-- 反馈按钮 -->
  <div class="feedback-button">
    <el-button type="primary" size="large" round class="feedback-btn" @click="showFeedbackForm">
      <el-icon>
        <ChatDotRound />
      </el-icon>
      反馈建议
    </el-button>
  </div>

  <!-- 意见反馈弹窗 -->
  <el-dialog  title="意见反馈" v-model="dialogVisible" width="30%" :show-close="false" :modal="true" :close-on-click-modal="false"
    :before-close="handleClose">
    <div class="dialog-content">
      <el-form :model="feedbackForm" label-width="80px">
        <el-form-item label="反馈内容" required>
          <el-input v-model="feedbackForm.content" type="textarea" :rows="4" placeholder="请输入您的反馈内容" />
        </el-form-item>
        <el-form-item label="联系方式">
          <el-input v-model="feedbackForm.contact" placeholder="请输入您的联系方式（选填）" />
        </el-form-item>
      </el-form>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitFeedback">提交</el-button>
      </div>
    </div>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ChatDotRound, Close } from '@element-plus/icons-vue'
import { ElMessage, ElButton, ElDialog, ElForm, ElFormItem, ElInput, ElIcon } from 'element-plus'
import axios from 'axios'

onMounted(() => {
  console.log('FeedbackButton 组件已加载')
})

const dialogVisible = ref(false)
const feedbackForm = reactive({
  content: '',
  contact: ''
})

const showFeedbackForm = () => {
  dialogVisible.value = true
}

const handleClose = () => {
  dialogVisible.value = false
  feedbackForm.content = ''
  feedbackForm.contact = ''
}

const submitFeedback = async () => {
  if (!feedbackForm.content) {
    ElMessage.warning('请输入反馈内容')
    return
  }

  try {
    await axios.post('/feedback', feedbackForm)
    ElMessage.success('感谢您的反馈！')
    handleClose()
  } catch (error) {
    ElMessage.error('提交失败，请稍后重试')
  }
}
</script>

<style scoped>
.feedback-button {
  position: fixed;
  right: 20px;
  bottom: 30px;
  z-index: 9999;
}

.feedback-btn {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  transition: transform 0.2s ease;
  font-weight: bold;
}

.feedback-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

.dialog-content {
  padding: 20px;
}

.dialog-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.dialog-title {
  font-size: 18px;
  font-weight: bold;
  margin: 0;
}

.close-icon {
  cursor: pointer;
  font-size: 18px;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  padding: 10px 0;
  margin-top: 10px;
}

:deep(.custom-dialog .el-dialog__header) {
  display: none;
}

:deep(.custom-dialog .el-dialog__body) {
  padding: 0;
}

:deep(.custom-dialog .el-dialog) {
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
</style>