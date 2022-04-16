<template>
  <div>
    <Head title="Create User" />
    <h1 class="mb-8 text-3xl font-bold">
      <Link class="text-indigo-400 hover:text-indigo-600" href="/users">Add Daily Report</Link>
      
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="store">
        <div class="flex flex-wrap -mb-8 p-8">

          <text-input v-model="form.month" :error="form.errors.month" type="month" class="pb-8 pr-6 w-full lg:w-1/2" label="Date" />

          <div class="flex flex-col w-full">
          <h1 class="text-lg leading-6 font-medium text-gray-900 mb-2">Monthly Report</h1>
          <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8 ">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg mb-10">
                <table class="min-w-full divide-y divide-gray-200">
                  <thead class="bg-gray-200">
                    <tr>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-900 uppercase tracking-wider">
                        Title
                      </th>
                      <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-900 uppercase tracking-wider">
                        Value/Amount
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Total Orders
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                        <strong>{{ commaSeperated(data.total_orders) }} </strong>
                      </td> 
                    </tr>
                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Completed Orders
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                        <strong>{{ commaSeperated(data.total_completed_orders) }} </strong> 
                      </td> 
                    </tr>
                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                       Pending Orders
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                        <strong>{{ commaSeperated(data.total_pending_orders) }} </strong>
                      </td> 
                    </tr>
                    <!-- <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                       Total Orders Cash Received
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                        <strong>{{ commaSeperated(data.total_orders_cash_received) }} </strong>
                      </td> 
                    </tr> -->
                    <tr>
                      <td colspan="2">
                        <hr>
                      </td>
                    </tr>
                    <tr class="bg-white">
                      <td style="width:250px" class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Sale / Recovery
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                        <strong>{{ commaSeperated(data.sale) }}</strong> <small>Rs</small>
                      </td>

                    </tr>

 
                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Delivery Cost
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                       <strong>{{ commaSeperated(data.delivery_cost) }} </strong> <small>Rs</small>
                      </td> 
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Book Cost
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                       <strong>{{ commaSeperated(data.book_cost) }} </strong> <small>Rs</small>
                      </td> 
                    </tr>

                    <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Profit
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                        <strong>{{ commaSeperated(data.profit) }} </strong> <small>Rs</small>
                      </td> 
                    </tr>
                    
                    
                     <tr class="bg-white">
                      <td class="px-4 py-1 whitespace-nowrap text-sm font-medium text-gray-900">
                        Expenses
                      </td>
                      <td class="px-4 py-1 whitespace-nowrap text-sm text-gray-900">
                       <strong>{{ commaSeperated(data.expense) }} </strong> <small>Rs</small>
                      </td> 
                    </tr>

 
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

          <hr>

        

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
    month:String,
    data:Object,
  },
  layout: Layout,
  // remember: 'form',
  data() {
    return {
       form: this.$inertia.form({
        month:this.month
       })
    }
  },
  computed:{
  
  },
  methods: {
     commaSeperated(val){
        var parts = val.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        val = parts.join(".");
        return val;
      },
  },
  mounted(){
    
  },
  watch:{
    "form.month":function(month){
      this.$inertia.get('/monthly-report', {
        month: month,
      })
    }
  }
}
</script>
