2.times {Thread.new { 10.times{|n| print rand(n+1); $stdout.flush; Thread.pass}}}
Thread.list.each{|thread| thread.join unless thread==Thread.main}