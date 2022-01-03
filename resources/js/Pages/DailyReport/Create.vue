<template>
  <div>
    <Head title="Create User" />
    <h1 class="mb-8 text-3xl font-bold">
      <Link class="text-indigo-400 hover:text-indigo-600" href="/users">Add Daily Report</Link>
      
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="flex flex-wrap -mb-8 p-8">

          <text-input v-model="form.date_min" :error="form.errors.date_min" type="date" class="pb-8 pr-6 w-full lg:w-1/2" label="Date" />

          <text-input v-model="dayInString" type="text" readonly="true" class="pb-8 w-full lg:w-1/2" label="Day" />

          <hr>


        <!-- Employee ================ -->
        <div class="flex flex-col w-full ">
          <h1 class="text-lg leading-6 font-medium text-gray-900 mb-2">Employee</h1>
          <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8 ">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg mb-10">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Employee Name
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Time in 
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Time out
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                       Action
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Odd row -->
                    <!-- bg-gray-50 -->
                    <tr class="bg-white">
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        Jane Cooper
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        Regional Paradigm Technician
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        jane.cooper@example.com
                      </td>
                     
                      <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                      </td>
                    </tr>

 
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- Employee ================ -->

        <!-- Daily Cash Flow ================ -->
        <div class="flex flex-col w-full">
          <h1 class="text-lg leading-6 font-medium text-gray-900 mb-2">Daily Cash Flow</h1>
          <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8 ">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg mb-10">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Title
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Amount
                      </th>
                      
                    </tr>
                  </thead>
                  <tbody>
                   
                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        BF
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ preData.daily_cash_flow_bf }}
                      </td>

                    </tr>

                     <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Sale / Recovery
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       {{ preData.daily_cash_flow_sales }}
                      </td> 
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Expenses
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       -{{ totalExpense }}
                      </td> 
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Bank Deposited
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       <text-input v-model="form.daily_cash_flow.bank_deposited" type="text" class-input="py-1" label="" />
                      </td> 
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Cash in Hand
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ totalCashInHand }}
                      </td> 
                    </tr>

 
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- Daily Cash Flow ================ -->

        <!-- Expense Details ================ -->
        <div class="flex flex-col w-full">
          <h1 class="text-lg leading-6 font-medium text-gray-900 mb-2">Expenses Details</h1>
          <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8 ">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg mb-10">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Title
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Amount 
                        <button type="button" @click.prevent="addExpense" class="inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                           Add
                        </button>
                      </th>
                      
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                       Action
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                     
                    <tr class="bg-white" v-for="(e,i) in form.expense_details">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        <text-input v-model="e.title" type="text" class-input="py-1" label="" />
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="e.amount" type="text" class-input="py-1" label="" />
                      </td>
                       
                      <td class="px-4 py-1 whitespace-nowrap text-left text-sm font-medium">
                         <button type="button" @click.prevent="deleteExpense(i)" class="inline-flex items-center px-2.5 py-1.5 border border-red-300 shadow-sm text-xs font-medium rounded text-red-700 bg-white hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Delete
                      </button>
                      </td>
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">
                        Total Expense
                      </td>
                      <td colspan="2" class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ totalExpense }}
                      </td>
                       
                    </tr>
 
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- Expense Details ================ -->

        <!-- Parcel Details ================ -->
        <div class="flex flex-col w-full">
          <h1 class="text-lg leading-6 font-medium text-gray-900 mb-2">Parcel Details</h1>
          <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8 ">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg mb-10">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        BF
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Current Orders
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Cash Received
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Returns
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Balance
                      </th>
                       
                    </tr>
                  </thead>
                  <tbody>
                
                    <tr class="bg-white">
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        {{ preData.parcel_detail_bf }}
                      </td>

                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="form.parcel_details.current_orders" type="text" class-input="py-1" />
                      </td>

                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="form.parcel_details.cash_received" type="text" class-input="py-1" />
                      </td>

                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="form.parcel_details.returns" type="text" class-input="py-1" />
                      </td>
                     
                      <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        
                      </td>
                    </tr>

                    <tr class="bg-white">
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        {{ preData.parcel_detail_amount_bf }}
                      </td>

                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="form.parcel_details.current_orders_amount" type="text" class-input="py-1" />
                      </td>

                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="form.parcel_details.cash_received_amount" type="text" class-input="py-1" />
                      </td>

                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="form.parcel_details.returns_amount" type="text" class-input="py-1" />
                      </td>
                     
                      <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        
                      </td>
                    </tr>

 
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- Parcel Details ================ -->

        <!-- Bank Account Details ================ -->
        <div class="flex flex-col w-full">
          <h1 class="text-lg leading-6 font-medium text-gray-900 mb-2">Bank Account Details</h1>
          <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8 ">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg mb-10">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-50">
                    <tr>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Transction Detail
                        <button type="button" @click.prevent="addBankAccount" class="inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                           Add
                        </button>
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                       Cash Type
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                       Amount
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                       Balance
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                       Action
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                     
                     <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                         BF
                      </td>
                      <td></td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500"></td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ preData.bank_account_detail_bf }}
                      </td>
                       
                      <td class="px-4 py-1 whitespace-nowrap text-left text-sm font-medium">
                       
                      </td>
                    </tr>
 
                    <tr class="bg-white" v-for="(e,i) in form.bank_account_details">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        <text-input v-model="e.title" type="text" class-input="py-1" label="" />
                      </td>
                      <td>
                        <fieldset class="mt-0">
                          
                          <div class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">
                            <div class="flex items-center">
                              <input :id="'bank_cash_type_in_'+i" v-model="e.cash_type" :name="'bank_cash_type_'+i" type="radio" value="in" checked class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                              <label :for="'bank_cash_type_in_'+i" class="ml-3 block text-sm font-medium text-gray-700">
                               Cash In
                              </label>
                            </div>

                            <div class="flex items-center">
                              <input :id="'bank_cash_type_out_'+i" v-model="e.cash_type" :name="'bank_cash_type_'+i" type="radio" value="out" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                              <label :for="'bank_cash_type_out_'+i" class="ml-3 block text-sm font-medium text-gray-700">
                                Cash Out
                              </label>
                            </div>
 
                          </div>
                        </fieldset>
                      </td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        <text-input v-model="e.amount" type="text" class-input="py-1" label="" />
                      </td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       {{ totalBankAccountBalance(i) }}
                      </td>
                       
                      <td class="px-4 py-1 whitespace-nowrap text-left text-sm font-medium">
                         <button type="button" @click.prevent="deleteBankAccount(i)" class="inline-flex items-center px-2.5 py-1.5 border border-red-300 shadow-sm text-xs font-medium rounded text-red-700 bg-white hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Delete
                      </button>
                      </td>
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        
                      </td>
                      <td>
                         
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       <strong> Cash In</strong>
                      </td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ totalCashIn }}
                      </td>
                       
                      <td class="px-4 py-1 whitespace-nowrap text-left text-sm font-medium">
                        
                      </td>
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        
                      </td>
                      <td>
                         
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       <strong> Cash Out</strong>
                      </td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ totalCashOut }}
                      </td>
                       
                      <td class="px-4 py-1 whitespace-nowrap text-left text-sm font-medium">
                        
                      </td>
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        
                      </td>
                      <td>
                         
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                       <strong> Final Balance</strong>
                      </td>

                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-500">
                        {{ totalBankAccountBalance(form.bank_account_details.length-1) }}
                      </td>
                       
                      <td class="px-4 py-1 whitespace-nowrap text-left text-sm font-medium">
                        
                      </td>
                    </tr>
 
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- Bank Account Details ================ -->
           
         <!--  <text-input v-model="form.date_max" :error="form.errors.date_max" type="date" class="pb-8 pr-6 w-full lg:w-1/2" label="Date Max" /> -->

        <!--   <text-input v-model="form.first_name" :error="form.errors.first_name" class="pb-8 pr-6 w-full lg:w-1/2" label="First name" />
          <text-input v-model="form.last_name" :error="form.errors.last_name" class="pb-8 pr-6 w-full lg:w-1/2" label="Last name" />
          <text-input v-model="form.email" :error="form.errors.email" class="pb-8 pr-6 w-full lg:w-1/2" label="Email" />
          <text-input v-model="form.password" :error="form.errors.password" class="pb-8 pr-6 w-full lg:w-1/2" type="password" autocomplete="new-password" label="Password" />
          <select-input v-model="form.owner" :error="form.errors.owner" class="pb-8 pr-6 w-full lg:w-1/2" label="Owner">
            <option :value="true">Yes</option>
            <option :value="false">No</option>
          </select-input>
          <file-input v-model="form.photo" :error="form.errors.photo" class="pb-8 pr-6 w-full lg:w-1/2" type="file" accept="image/*" label="Photo" /> -->
        </div>
        <div class="flex items-center justify-end px-8 py-4 bg-gray-50 border-t border-gray-100">
          <loading-button :loading="form.processing" class="btn-indigo" type="submit">Add Report</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { Head, Link } from '@inertiajs/inertia-vue3'
import Layout from '@/Shared/Layout'
import FileInput from '@/Shared/FileInput'
import TextInput from '@/Shared/TextInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
const { DateTime } = require("luxon");

export default {
  components: {
    FileInput,
    Head,
    Link,
    LoadingButton,
    SelectInput,
    TextInput,
  },
  props:{
    dateMin:String,
    dateMax:String,
    preData:Object,
  },
  layout: Layout,
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        date_min: this.dateMin,
        date_max: this.dateMax,
        daily_cash_flow:{
          bank_deposited:0
        },
        employees:[
        ],
        expense_details:[
        ],
        parcel_details:{
          current_orders:null,
          cash_received:null,
          returns:null,
          current_orders_amount:null,
          cash_received_amount:null,
          returns_amount:null,
        },
        bank_account_details:[
        ]
      }),
    }
  },
  computed:{
    dayInString(){
      return DateTime.fromFormat(this.form.date_min,'yyyy-MM-dd').toFormat('cccc');
    },

    // Daily Flow
    totalCashInHand(){

      var bd = this.form.daily_cash_flow.bank_deposited;
      if(isNaN(bd) || bd === "" || bd === null){
        bd = 0;
      }
      console.log(bd)
      return (this.preData.daily_cash_flow_bf + this.preData.daily_cash_flow_sales) - (parseFloat(this.totalExpense) + parseFloat(bd));
    },

    // Expense Details
    totalExpense(){
      var t = this.form.expense_details.map(item => item.amount).reduce((prev, curr) => {
        return this.parseAmount(prev, curr)
      }, 0);

      if(t == "" || t == null || isNaN(t)){
        return 0
      }
      return t;
    },
    totalCashIn(){
      var t = this.form.bank_account_details.map(item => {
        if(item.cash_type == 'in'){
          return item.amount;
        }
      }).reduce((prev, curr) => {
         
        return this.parseAmount(prev, curr)
      }, 0);

      if(t == "" || t == null || isNaN(t)){
        return 0
      }
      return t;
    },
    totalCashOut(){
      var t = this.form.bank_account_details.map(item => {
        if(item.cash_type == 'out'){
          return item.amount;
        }
      }).reduce((prev, curr) => {
         return this.parseAmount(prev, curr)
      }, 0);

      if(t == "" || t == null || isNaN(t)){
        return 0
      }
      return t;
    }
  },
  methods: {
    parseAmount(prev,curr){
      if(prev == "" || prev == null || isNaN(prev)){
        curr = Math.abs(curr)
        return curr;
      }
      if(curr == "" || curr == null || isNaN(curr)){

        prev = Math.abs(prev)
        return prev;
      }
      curr = Math.abs(curr)
      prev = Math.abs(prev)
      return parseFloat(prev) + parseFloat(curr)
      ;
    },
    addEmployee(){
      return {
        name:"",
        time_in:"",
        time_out:"",
      }
    },
    addExpense(){
      this.form.expense_details.push({
        title:"",
        amount:null,
      })
    },
    deleteExpense(i){
       this.form.expense_details.splice(i,1)
    },
    addBankAccount(){
      this.form.bank_account_details.push({
        title:"",
        cash_type:"out",
        amount:null,
      })
    },
    deleteBankAccount(i){
       this.form.bank_account_details.splice(i,1)
    },
    totalBankAccountBalance(i){
      if(i == -1){
        return 0;
      }

      var item = this.form.bank_account_details[i];
      var itemAmount = item.amount;
      if(itemAmount == "" || itemAmount == null || isNaN(itemAmount)){
        itemAmount = 0;
      }else{
        itemAmount = parseFloat(itemAmount)
      }
      if(i == 0){
        if(item.cash_type == 'in'){
          return this.preData.bank_account_detail_bf + itemAmount;
        }else{
          return this.preData.bank_account_detail_bf - itemAmount;
        }
      }else{
        if(item.cash_type == 'in'){
          return this.totalBankAccountBalance(i-1) + itemAmount;
        }else{
          return this.totalBankAccountBalance(i-1) - itemAmount;
        }
      }

    },
    store() {
      this.form.post('/daily-report/add')
    },
  },
}
</script>
