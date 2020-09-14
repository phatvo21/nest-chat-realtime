import { Module } from '@nestjs/common';
import { MessageGateway } from './message.gateway';

@Module({
  imports: [],
  controllers: [],
  providers: [MessageGateway],
})
export class MessageModule {}
