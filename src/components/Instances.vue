<template>
   <div class="card-columns">
      
        <div
                v-for="instance in instances"
                :key="instance.id"
                class="card text-center"
                :class="[instance.isRunning ? 'border-success' : 'border-danger']"
                style="width: 20rem"
        >
          <div 
                class="card-header"
                
          >
            {{ instance.name }}
          </div>
          <div class="card-body">
            <h5 
                class="card-title"
                :class="[instance.isRunning ? 'text-success' : 'text-danger']"
            >{{ instance.isRunning ? 'Running' : 'NOT RUNNING' }}</h5>
            <p 
                class="card-text"
                :class="[instance.isWorking ? 'text-success' : 'text-danger']"
            >{{ instance.isWorking ? 'Working' :  '** Not Processing **' }}</p>
            <a href="#" 
                class="btn btn-secondary"
                :class="[instance.isRunning && instance.isWorking ? 'btn-success' : 'btn-secondary']"
            >Details</a>
          </div>
        </div>
   
  </div>
</template>

<script>
import io from 'socket.io-client';
import { eventBus } from '../main';

//var socket = io();
const socket = io('http://localhost:3000', { transports : ['websocket'] });

socket.on('status', function (data) {
    console.log('Got the socket communication: ' + JSON.stringify(data));
    eventBus.$emit('statusChanged', data);
});
  
export default {
  data() {
      return {
          instances: [],
          test: 'hello'
      }
  },
  created() {
    this.init();
    eventBus.$on('statusChanged', (data) => {
      // find the instance in the array
      var matchingInstance = this.instances.find( (instance) => {
        return instance.name === data.name
      });

      matchingInstance.isRunning = data.isRunning;
      matchingInstance.isWorking = data.isWorking;

    })
  },
  methods: {
    init() {
      for(let i = 1; i < 25; i++) {
        const instance = {
          id: i,
          name: 'instance-' + i,
          isRunning: false,
          isWorking: false
        };
        this.instances.push(instance);
      }
    }
  }
}
</script>

