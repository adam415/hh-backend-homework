<template>
  <el-dialog
    title="Создание компании"
    :visible.sync="dialogVisible"
    width="30%"
    :before-close="handleClose">
    <el-form ref="createCompanyForm" :model="form" :rules="rules">
      <el-form-item label="Название компании" prop="companyName">
        <el-input v-model="form.companyName"/>
      </el-form-item>
      <el-form-item label="Пользователь" prop="companyUserId">
        <el-select v-model="form.companyUserId" placeholder="Select">
          <el-option
            v-for="employer in employers"
            :key="employer.id"
            :label="employer.name"
            :value="employer.id">
          </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button type="primary" @click="onCreateUserClick">Создать</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import { createCompany } from './../api/company'
  import { getUsers } from '../api/user'

  export default {
    name: 'CreateCompanyForm',
    data () {
      return {
        dialogVisible: false,
        form: {
          companyName: '',
          companyUserId: '',
        },
        rules: {
          companyName: [
            { required: true, message: 'Заполните название компании', trigger: 'blur' }
          ],
          companyUserId: [
            { required: true, message: 'Выберите пользователя', trigger: 'change' }
          ]
        },
        employers: []
      }
    },
    methods: {
      open () {
        this.dialogVisible = true
        this.loadEmployers()
      },
      clearForm () {
        this.$refs['createCompanyForm'].resetFields()
      },
      handleClose (done) {
        this.clearForm()
        done()
      },
      onCreateUserClick () {
        this.$refs['createCompanyForm'].validate((valid) => {
          if (valid) {
            createCompany({
              name: this.form.companyName,
              userId: this.form.companyUserId,
            })
              .then(() => {
                this.clear()
                this.dialogVisible = false
                this.clearForm()
              })
          } else {
            return false
          }
        })
      },
      loadEmployers () {
        getUsers('employer')
          .then(response => {
            this.employers = response.data
          })
      }
    }
  }
</script>

<style scoped>

</style>
