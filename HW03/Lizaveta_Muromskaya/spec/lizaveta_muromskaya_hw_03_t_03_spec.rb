# frozen_string_literal: true

require 'rspec'
require_relative './lizaveta_muromskaya_hw_03_t_03'
log = <<~LOGS
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
LOGS
log_with_one_event = <<~LOGS
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
LOGS
log_with_three_events = <<~LOGS
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
LOGS
log_without_events = <<~LOGS
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
LOGS

obj = Task.new

RSpec.describe 'Array of formatted strings containing information about post requests' do
  describe 'Log that has wrong output' do
    context 'when no arguments given' do
      it 'return ArgumentError' do
        expect { obj.task3 }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'Log that has right output' do
    context 'when there is more than 2 valid event' do
      it 'duration of the action in seconds between events' do
        expect(obj.task3(log_with_three_events)).to eq(['49.1', '60.0'])
      end
    end

    context 'when there are no valid events' do
      it 'return 0' do
        expect(obj.task3(log_without_events)).to eq('0')
      end
    end

    context 'when there is one valid event' do
      it 'return 0' do
        expect(obj.task3(log_with_one_event)).to eq('0')
      end
    end

    context 'when there is two valid event' do
      it 'return duration of the action in seconds between events' do
        expect(obj.task3(log)).to eq('49.1')
      end
    end
  end
end
