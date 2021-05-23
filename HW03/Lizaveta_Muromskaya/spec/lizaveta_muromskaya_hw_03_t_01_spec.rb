# frozen_string_literal: true

require 'rspec'
require_relative '../lizaveta_muromskaya_hw_03_t_01'

RSpec.describe '.task1' do
  describe 'Log that has right output' do
    subject { task1(log) }

    context 'when logs have one error' do
      let(:log) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end
      let(:right_output) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'return full text of the first line with an error' do
        expect(subject).to eq(right_output)
      end
    end

    context 'when logs have more than one error' do
      let(:log) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
          2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        LOGS
      end

      let(:right_output) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'full text of the first line with an error' do
        expect(subject).to eq(right_output)
      end
    end

    context 'when logs have no lines with error' do
      let(:log) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'return an empty string' do
        expect(subject).to eq('')
      end
    end
  end

  describe 'Log that has wrong output' do
    context 'when text are not given' do
      it 'return an empty string' do
        expect('').to eq('')
      end
    end

    context 'when no arguments is given' do
      it 'return ArgumentError' do
        expect { task1 }.to raise_error(ArgumentError)
      end
    end
  end
end
