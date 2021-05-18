# frozen_string_literal: true

require 'rspec'
require_relative './lizaveta_muromskaya_hw_03_t_01'

log = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
LOGS
log_with_errors = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
  2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
LOGS
log_without_errors = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
LOGS

right_output = '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'

RSpec.describe 'Array of formatted strings containing information about post requests' do
  describe 'Log that has right output' do
    context 'when logs have one error' do
      it 'return full text of the first line with an error' do
        expect(task1(log)).to eq(right_output)
      end
    end

    context 'when logs have more than one error' do
      it 'full text of the first line with an error' do
        expect(task1(log_with_errors)).to eq(right_output)
      end
    end

    context 'when logs have no lines with error' do
      it 'return an empty string' do
        expect(task1(log_without_errors)).to eq('')
      end
    end
  end

  describe 'Log that has wrong output' do
    context 'when text are not given' do
      it 'return an empty string' do
        expect(task1('')).to eq('')
      end
    end

    context 'when no arguments is given' do
      it 'return ArgumentError' do
        expect { task1 }.to raise_error(ArgumentError)
      end
    end
  end
end
