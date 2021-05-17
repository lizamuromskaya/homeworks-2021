# frozen_string_literal: true

require 'rspec'
require_relative './lizaveta_muromskaya_hw_03_t_02'

log = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
LOGS
log_in_the_wrong_format = <<~LOGS
   10.6.246.103 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - -"POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - -"POST /test/2/messages HTTP/1.1" 200 48 0.0290
LOGS
log_with_errors = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
  2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
LOGS
log_without_errors = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
LOGS

right_output = [
  'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
  'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
  'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
]

RSpec.describe 'Array of formatted strings containing information about post requests' do
  describe 'Log that has wrong output' do
    context 'when text are not given' do
      it 'return an empty array' do
        expect(task2('')).to  eq([])
      end
    end

    context 'when text given in wrong format' do
      it 'return an empty array' do
        expect(task2(log_in_the_wrong_format)).to eq([])
      end
    end
    context 'when no arguments is given' do
      it 'return ArgumentError' do
        expect { task2 }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'Log that has right output' do
    context 'when text given in right format' do
      it 'return an array of formatted strings' do
        expect(task2(log)).to eq(right_output)
      end
    end
    context 'when logs have more than one error' do
      it 'return an array of formatted strings' do
        expect(task2(log_with_errors)).to eq(right_output)
      end
    end
    context 'when logs have no lines with error' do
      it 'return an array of formatted strings' do
        expect(task2(log_without_errors)).to eq(right_output)
      end
    end
  end
end
